import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakwir_cetem_reborn/app/contants/web_services.dart';
import 'package:jakwir_cetem_reborn/app/modules/common/cache_maanger.dart';
import 'package:jakwir_cetem_reborn/app/routes/app_pages.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController with CacheManager {
  GlobalKey<FormState> loginFormKey =
      GlobalKey<FormState>(debugLabel: '_loginScreen');
  final nikController = TextEditingController();
  final passwordController = TextEditingController();
  final loading = false.obs;

  var isShowPassword = true.obs;

  void setIsShowPassword(bool status) {
    isShowPassword.value = status;
    update();
  }

  String? validator(String? value) {
    if (value == "") {
      return 'Harus diisi';
    }
    return null;
  }

  void login() {
    if (loginFormKey.currentState!.validate()) {
      loading.value = true;
      checkUser(nikController.text, passwordController.text).then((auth) {
        if (auth) {
          Get.offAllNamed(Routes.LAYOUT);
        } else {
          Get.snackbar('Login', 'Invalid email or password');
        }
        nikController.clear();
        passwordController.clear();
      });
    }
  }

  Future<bool> checkUser(String nik, String password) async {
    Uri url = Uri.parse("$BASE_URL_API/login");
    var res = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{"nik": nik, "password": password}));

    if (res.statusCode == 200) {
      Map<String, dynamic> body = json.decode(res.body) as Map<String, dynamic>;
      if (body['code'] == 200) {
        Map<String, dynamic> data =
            (json.decode(res.body) as Map<String, dynamic>)["data"][0];
        saveToken(data["token"]);
        saveUser(jsonEncode({...data["warga"], "email": data["email"]}));
        loading.value = false;

        return true;
      } else {
        loading.value = false;
        return false;
      }
    }

    loading.value = false;

    return false;
  }
}
