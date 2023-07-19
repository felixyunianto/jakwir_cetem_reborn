import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakwir_cetem_reborn/app/contants/web_services.dart';
import 'package:http/http.dart' as http;
import 'package:jakwir_cetem_reborn/app/modules/common/cache_maanger.dart';
import 'package:jakwir_cetem_reborn/app/routes/app_pages.dart';

class FormKiaController extends GetxController with CacheManager {
  final personData = Get.arguments;
  final loading = false.obs;

  final kiaFormKey = GlobalKey<FormState>(debugLabel: "_kiaFormKey");

  final nikPemohonController = TextEditingController();
  final nikAnakController = TextEditingController();
  final txtFilePicker = TextEditingController();
  final filePickerVal = "".obs;

  String? validator(String? value) {
    if (value == "") {
      return 'Harus diisi';
    }
    return null;
  }

  @override
  void onInit() {
    nikAnakController.text = personData["nik"];
    super.onInit();
  }

  void submit() {
    if (kiaFormKey.currentState!.validate()) {
      submitKia().then((res) {
        if (res.isNotEmpty) {
          Get.snackbar("Berhasil", "Permohonan KIA berhasil terkirim");
          Timer(Duration(seconds: 2), () {
            Get.offAndToNamed(Routes.HOME);
          });
        } else {
          Get.snackbar("Gagal", "Permohonan KIA gagal terkirim");
        }
      });
    }
  }

  Future<dynamic> submitKia() async {
    Uri uri = Uri.parse("$BASE_URL_API/permohonankia");
    var res = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "Bearer ${getToken()}"
        },
        body: jsonEncode(<String, dynamic>{
          "nik_pemohon_id": nikPemohonController.text,
          "nik_anak_id": nikAnakController.text,
          "img_anak": filePickerVal.value
        }));

    Map<String, dynamic> data = json.decode(res.body);
    if (data["code"] != 500) {
      loading.value = false;

      return data;
    } else {
      return {};
    }
  }
}
