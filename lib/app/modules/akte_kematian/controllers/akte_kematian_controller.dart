import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:jakwir_cetem_reborn/app/contants/web_services.dart';
import 'package:jakwir_cetem_reborn/app/modules/common/cache_maanger.dart';

class AkteKematianController extends GetxController with CacheManager {
  final kKFormKey =
      GlobalKey<FormState>(debugLabel: '_akteKematianKK');
  final kkController = TextEditingController();

  final babyNoNIKFormKey =
      GlobalKey<FormState>(debugLabel: '_akteKematianBaby');
  final nikBabyNoNIK = TextEditingController();

  var familyList = [].obs;

  String? validator(String? value) {
    if (value == "") {
      return 'Harus diisi';
    }
    return null;
  }

  String? validatorBabyNoNIK(String? value) {
    if (value == "") {
      return 'Harus diisi';
    }
    return null;
  }

  void doFindKK() {
    if (kKFormKey.currentState!.validate()) {
      getKKList(kkController.text).then((value) {
        familyList.value = value!;
      });
    } else {
      Get.snackbar("Warning", "Isi field nomor kk terlebih dahulu");
    }
  }

  Future<List<dynamic>?> getKKList(String nokk) async {
    Uri url = Uri.parse("$BASE_URL_API/keluarga/$nokk");
    var res = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer ${getToken()}"
      },
    );

    if (res.statusCode == 200) {
      List<dynamic> data =
          (json.decode(res.body) as Map<String, dynamic>)["data"];
      return data;
    }
    return null;
  }

  void resetFindKK() {
    kkController.text = '';
    familyList.value = [];
  }
}
