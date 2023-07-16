import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakwir_cetem_reborn/app/contants/web_services.dart';
import 'package:http/http.dart' as http;
import 'package:jakwir_cetem_reborn/app/modules/common/cache_maanger.dart';
import 'package:jakwir_cetem_reborn/app/routes/app_pages.dart';

class FormReportController extends GetxController with CacheManager {
  var personData = Get.arguments;
  final loading = false.obs;

  final listKecamatan = [].obs;
  final listKelurahan = [].obs;
  final listTempatMati = [].obs;
  final listSebabMati = [].obs;
  final listYangMenerangkan = [].obs;

  GlobalKey<FormState> akterKemarinFormKey =
      GlobalKey<FormState>(debugLabel: '_akteKematianForm');

  final nikController = TextEditingController();
  final dateController = TextEditingController();
  final tempatMatiSelected = {}.obs;
  final kecamatanSelected = {}.obs;
  final kelurahanSelected = {}.obs;
  final sebabMatiSelected = {}.obs;
  final yangMenerangkanSelected = {}.obs;
  final txtFilePicker = TextEditingController();
  final filePickerVal = "".obs;
  final noSuratController = TextEditingController();
  final nikPelaporcontroller = TextEditingController();
  final hubPelaporController = TextEditingController();
  final nikSaksi1Controller = TextEditingController();
  final nikSaksi2Controller = TextEditingController();

  @override
  void onInit() {
    getKecamatan();
    getSebabMati();
    getTempatMati();
    getYangMenerangkan();
    nikController.text = personData["nik"];
    super.onInit();
  }

  void selectedDropdown(String type, dynamic value) {
    if (type == "kecamatan") {
      kecamatanSelected.value = value;
      getKelurahan(value['id']);
    } else if (type == "kelurahan") {
      kelurahanSelected.value = value;
    } else if (type == "tempat-mati") {
      tempatMatiSelected.value = value;
    } else if (type == "sebab-mati") {
      sebabMatiSelected.value = value;
    } else if (type == "yang-menerangkan") {
      yangMenerangkanSelected.value = value;
    }
  }

  String? validator(dynamic value) {
    if (value.isEmpty) {
      return 'Harus diisi';
    }
    return null;
  }

  Future<dynamic> getKecamatan() async {
    loading.value = true;
    Uri url = Uri.parse("$BASE_URL_API/kecamatan/kotakab/$HARCODE_CITY_COD");
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

      listKecamatan.value = data;
      var initialKecamatan = data
          .where((element) => element['nama'] == personData['kecamatan'])
          .toList();
      kecamatanSelected.value = initialKecamatan[0];
      getKelurahan(initialKecamatan[0]["id"]);
    } else {
      listKecamatan.value = [];
    }
  }

  Future<dynamic> getSebabMati() async {
    loading.value = true;
    Uri url = Uri.parse("$BASE_URL_API/aktakematian/sebab-mati");
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

      listSebabMati.value = data;
      sebabMatiSelected.value = data[0];
    } else {
      listSebabMati.value = [];
    }
    loading.value = false;
  }

  Future<dynamic> getTempatMati() async {
    loading.value = true;
    Uri url = Uri.parse("$BASE_URL_API/aktakematian/tempat");
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

      listTempatMati.value = data;
      tempatMatiSelected.value = data[0];
    } else {
      listTempatMati.value = [];
    }
    loading.value = false;
  }

  Future<dynamic> getYangMenerangkan() async {
    loading.value = true;
    Uri url = Uri.parse("$BASE_URL_API/aktakematian/yang-menerangkan");
    var res = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer ${getToken()}"
      },
    );

    if (res.statusCode == 200) {
      List<dynamic> data = (json.decode(res.body) as List<dynamic>);
      listYangMenerangkan.value = data;
      yangMenerangkanSelected.value = data[0];
    } else {
      listYangMenerangkan.value = [];
    }
    loading.value = false;
  }

  Future<dynamic> getKelurahan(String idKecamatan) async {
    loading.value = true;
    Uri url = Uri.parse("$BASE_URL_API/kelurahan/kecamatan/$idKecamatan");
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

      listKelurahan.value = data;
      var initialKelurahan = data
          .where((element) => element['nama'] == personData['kelurahan'])
          .toList();

      kelurahanSelected.value =
          initialKelurahan.length > 0 ? initialKelurahan[0] : data[0];
    } else {
      listKelurahan.value = [];
    }
    loading.value = false;
  }

  void submit() {
    loading.value = true;
    if (akterKemarinFormKey.currentState!.validate()) {
      submitAkteKematian().then((res) {
        if (res.isNotEmpty) {
          Get.snackbar(
              "Berhasil", "Permohonan akta kematian berhasil terkirim");
          Timer(Duration(seconds: 2), () {
            Get.offAndToNamed(Routes.HOME);
          });
        } else {
          Get.snackbar("Gagal", "Permohonan akta kematian gagal terkirim");
        }
      });
    }
    loading.value = false;
  }

  Future<dynamic> submitAkteKematian() async {
    Uri url = Uri.parse("$BASE_URL_API/aktakematian");
    var res = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "Bearer ${getToken()}"
        },
        body: jsonEncode(<String, dynamic>{
          'nik_id': nikController.text,
          'tanggal_mati': dateController.text,
          'tempat_mati_id': tempatMatiSelected.value["id"],
          'id_kelurahan_id': kelurahanSelected.value['id'],
          'sebab_mati_id': sebabMatiSelected.value["id"],
          'yang_menerangkan_id': yangMenerangkanSelected.value["id"],
          'surat_keterangan': filePickerVal.value,
          'no_surat_keterangan': noSuratController.text,
          'nik_pelapor_id': nikPelaporcontroller.text,
          'hub_pelapor': hubPelaporController.text,
          'nik_saksi1_id': nikSaksi1Controller.text,
          'nik_saksi2_id': nikSaksi2Controller.text,
        }));

    if (res.statusCode == 200) {
      Map<String, dynamic> data = json.decode(res.body);
      loading.value = false;

      return data;
    } else {
      return {};
    }
  }
}
