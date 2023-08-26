import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakwir_cetem_reborn/app/contants/web_services.dart';
import 'package:http/http.dart' as http;
import 'package:jakwir_cetem_reborn/app/routes/app_pages.dart';

class ChangePasswordController extends GetxController {
  GlobalKey<FormState> changePasswordFormKey =
      GlobalKey<FormState>(debugLabel: '_changePasswordScreen');
  final otpController = TextEditingController();
  final passwordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final loading = false.obs;

  var isShowPassword = true.obs;

  void setIsShowPassword(bool status) {
    isShowPassword.value = status;
    update();
  }

  var isShowNewPassword = true.obs;

  void setIsShowNewPassword(bool status) {
    isShowNewPassword.value = status;
    update();
  }

  String? validator(String? value) {
    if (value == "") {
      return 'Harus diisi';
    }
    return null;
  }

  void changePassword() {
    if (passwordController.text != newPasswordController.text) {
      Get.snackbar("Gagal", "Password dan konfirmasi password salah");
    } else {
      checkUser(otpController.text, passwordController.text).then((auth) {
        if (auth) {
          if (auth) {
            Get.offAllNamed(Routes.LOGIN);
          } else {
            Get.snackbar('Ubah Password', 'Terjadi kesalahan');
          }
          passwordController.clear();
          newPasswordController.clear();
          otpController.clear();
        } else {
          Get.snackbar('Ubah Password', 'Terjadi kesalahan');
        }
      });
    }
  }

  Future<bool> checkUser(String otp, String password) async {
    Uri url = Uri.parse("$BASE_URL_API/change-password");
    var res = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body:
            jsonEncode(<String, String>{"otp": otp, "new_password": password}));

    Map<String, dynamic> body = json.decode(res.body) as Map<String, dynamic>;
    if (res.statusCode == 200) {
      Get.snackbar("Berhasil", "Sandi berhasil diubah");
      loading.value = false;

      return true;
    }

    loading.value = false;

    return false;
  }
}
