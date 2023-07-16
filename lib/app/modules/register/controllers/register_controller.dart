import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakwir_cetem_reborn/app/contants/web_services.dart';
import 'package:http/http.dart' as http;
import 'package:jakwir_cetem_reborn/app/routes/app_pages.dart';

class RegisterController extends GetxController {
  GlobalKey<FormState> registerKey =
      GlobalKey<FormState>(debugLabel: '_registerKey');
  final niKController = TextEditingController();
  final kkController = TextEditingController();
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

  void register() {
    if (registerKey.currentState!.validate()) {
      loading.value = true;
      doRegister().then((response) {
        if (response) {
          Timer(const Duration(seconds: 3), () {
            Get.offAllNamed(Routes.LOGIN);
          });
        } else {
          return;
        }
      });
    }
  }

  Future<dynamic> doRegister() async {
    Uri url = Uri.parse("$BASE_URL_API/register");
    var res = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "nik": niKController.text,
          "nokk": kkController.text,
          "password": passwordController.text
        }));

    Map<String, dynamic> data = (json.decode(res.body) as Map<String, dynamic>);

    if (data["code"] == 200) {
      loading.value = false;
      Get.snackbar("Info", data['message']);
      return true;
    } else {
      print(jsonEncode(<String, String>{
          "nik": niKController.text,
          "nokk": kkController.text,
          "password": passwordController.text
        }));
      Get.snackbar("Error", data['message']);
      loading.value = false;

      return false;
    }
  }
}
