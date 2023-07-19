import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:jakwir_cetem_reborn/app/contants/web_services.dart';
import 'package:jakwir_cetem_reborn/app/modules/common/cache_maanger.dart';
import 'package:jakwir_cetem_reborn/app/routes/app_pages.dart';

class AkteKelahiranController extends GetxController with CacheManager {
  final kKFormKey = GlobalKey<FormState>(debugLabel: '_akteKelahirKK');
  final kkController = TextEditingController();

  final babyNoNIKFormKey = GlobalKey<FormState>(debugLabel: '_akteKelahirBaby');
  final nikBabyNoNIK = TextEditingController();

  var familyList = [].obs;

  var listPermohonan = [].obs;

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
        value.forEach((element) {
          getListPermohonanAkteKelahiran(element['nik']);
        });
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
    listPermohonan.value = [];
  }

  void submitBabyNoNIK() {
    if (babyNoNIKFormKey.currentState!.validate()) {
      Get.toNamed(Routes.FORM_REPORT_KELAHIRAN,
          arguments: [null, nikBabyNoNIK.text]);
    }
  }

  Future<dynamic> getListPermohonanAkteKelahiran(
      String nikKepalaKeluarga) async {
    Uri url =
        Uri.parse("$BASE_URL_API/aktakelahiran/pemohon/$nikKepalaKeluarga");
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

      data.forEach((element) {
        listPermohonan.add(Map<String, dynamic>.from(element));
      });
      return data;
    } else {
      listPermohonan.value = [];
    }
  }
}
