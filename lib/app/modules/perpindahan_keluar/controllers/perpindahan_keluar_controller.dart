import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakwir_cetem_reborn/app/contants/web_services.dart';
import 'package:http/http.dart' as http;
import 'package:jakwir_cetem_reborn/app/modules/common/cache_maanger.dart';

class PerpindahanKeluarController extends GetxController with CacheManager {
  GlobalKey<FormState> perpindahanKeluarKKFormKey =
      GlobalKey<FormState>(debugLabel: '_perpindahanKeluar');
  final kkController = TextEditingController();

  final userLogin = {}.obs;
  var familyList = [].obs;
  var listPermohonan = [].obs;

  String? validator(String? value) {
    if (value == "") {
      return 'Harus diisi';
    }
    return null;
  }

  void doFindKK() {
    final user = jsonDecode(getUser()!);
    userLogin.value = user;
    if (perpindahanKeluarKKFormKey.currentState!.validate()) {
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
        value.forEach((element) {
          getListPermohonanPindah(element['nik']);
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

  Future<dynamic> getListPermohonanPindah(String nikPelapor) async {
    Uri url = Uri.parse("$BASE_URL_API/pindahkeluar/pemohon/nik/$nikPelapor");
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
