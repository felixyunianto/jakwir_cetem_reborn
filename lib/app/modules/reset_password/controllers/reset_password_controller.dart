import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakwir_cetem_reborn/app/contants/web_services.dart';
import 'package:http/http.dart' as http;
import 'package:jakwir_cetem_reborn/app/routes/app_pages.dart';

class ResetPasswordController extends GetxController {
  GlobalKey<FormState> resetPasswordFormKey =
      GlobalKey<FormState>(debugLabel: '_resetScreen');
  final emailController = TextEditingController();
  final loading = false.obs;

  String? validator(String? value) {
    if (value == "") {
      return 'Harus diisi';
    }
    return null;
  }

  void resetPassword() {
    if (resetPasswordFormKey.currentState!.validate()) {
      loading.value = true;
      checkUser(emailController.text)
      .then((auth) {
        if (auth) {
          Get.offAllNamed(Routes.CHANGE_PASSWORD);
        } else {
          Get.snackbar('Reset Password', 'Tidak ada email yang terdaftar');
        }
        emailController.clear();
      });
    }
  }

  Future<bool> checkUser(String email) async {
    Uri url = Uri.parse("$BASE_URL_API/reset-password");
    var res = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{"email": email}));

    if (res.statusCode == 200) {
      Get.snackbar("Berhasil", "Kode OTP telah terkirim, silahkan check email anda.");
      loading.value = false;

      return true;
    }

    return false;
  }
}
