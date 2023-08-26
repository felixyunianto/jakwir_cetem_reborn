import 'dart:convert';

import 'package:age_calculator/age_calculator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakwir_cetem_reborn/app/contants/web_services.dart';
import 'package:http/http.dart' as http;
import 'package:jakwir_cetem_reborn/app/modules/common/cache_maanger.dart';

class KiaController extends GetxController with CacheManager {
  GlobalKey<FormState> kikKKFormKey =
      GlobalKey<FormState>(debugLabel: '_kiaFormKey');
  final kkController = TextEditingController();

  var familyList = [].obs;

  var listPermohonan = [].obs;

  @override
  void onReady() {
    // TODO: implement onReady
    age(DateTime.parse("1994-04-28T00:00:00"));
    super.onReady();
  }

  String? validator(String? value) {
    if (value == "") {
      return 'Harus diisi';
    }
    return null;
  }

  void doFindKK() {
    if (kikKKFormKey.currentState!.validate()) {
      getKKList(kkController.text).then((value) {
        familyList.value = value!;

        familyList.value.asMap().forEach((index, element) {
          if (element['status_hub_kel'] == "KEPALA KELUARGA") {
            var kepalaKeluarga = familyList.value.removeAt(index);
            familyList.value.insert(0, kepalaKeluarga);
          }
        });

        familyList.value.asMap().forEach((index, element) {
          if (element['status_hub_kel'].toLowerCase() == "istri") {
            var istri = familyList.value.removeAt(index);
            familyList.value.insert(1, istri);
          }
        });

        (value).forEach((element) {
          getListPermohonanKIA(element['nik']);
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
  }

  DateDuration age(DateTime dob) {
    DateTime birthday = dob;
    DateDuration duration;

    // Find out your age as of today's date 2021-03-08
    duration = AgeCalculator.age(birthday);
    print(duration.years > 18);
    return duration;
  }

  Future<dynamic> getListPermohonanKIA(
      String nikKepalaKeluarga) async {
    Uri url =
        Uri.parse("$BASE_URL_API/pemohonankia/pemohon/$nikKepalaKeluarga");
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
