// ignore_for_file: invalid_use_of_protected_member

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakwir_cetem_reborn/app/contants/web_services.dart';
import 'package:http/http.dart' as http;
import 'package:jakwir_cetem_reborn/app/modules/common/cache_maanger.dart';
import 'package:jakwir_cetem_reborn/app/routes/app_pages.dart';

class FormPindahController extends GetxController with CacheManager {
  var personData = Get.arguments;
  final loading = false.obs;

  final listKecamatanAsal = [].obs;
  final listKelurahanAsal = [].obs;

  final listKecamatanTujuan = [].obs;
  final listKelurahanTujuan = [].obs;

  final listKlasifikasiPindahan = [].obs;
  final listJenisPindahan = [].obs;
  final listStatusKKNonPindah = [].obs;

  final perpindahanKeluarFormKey =
      GlobalKey<FormState>(debugLabel: "_perpindahanKeluar");

  final nikPemohonController = TextEditingController();
  final alamatAsalController = TextEditingController();
  final rtAsalController = TextEditingController();
  final rwAsalController = TextEditingController();
  final kecamatanSelected = {}.obs;
  final kelurahanSelected = {}.obs;
  final alamatTujuanController = TextEditingController();
  final rtTujuanController = TextEditingController();
  final rwTujuanController = TextEditingController();
  final kecamatanTujuanSelected = {}.obs;
  final kelurahanTujuanSelected = {}.obs;
  final klasifikasiPindahanSelected = {}.obs;
  final jenisPindahanSelected = {}.obs;
  final statusKKNonPindahSelected = {}.obs;
  final alasanPindahController = TextEditingController();

  String? validator(dynamic value) {
    if (value == "") {
      return 'Harus diisi';
    }
    return null;
  }

  @override
  void onInit() {
    getKecamatan();
    getKecamatanTujuan();
    getKlasifikasiPindahan();
    getJenisPindahan();
    getStatusKKNonPindah();
    nikPemohonController.text = personData['nik'];
    super.onInit();
  }

  void selectedDropdown(String type, dynamic value) {
    if (type == "kecamatan") {
      kecamatanSelected.value = value;
      getKelurahan(value['id']);
    } else if (type == "kelurahan") {
      kelurahanSelected.value = value;
    } else if (type == "kecamatan-tujuan") {
      kecamatanTujuanSelected.value = value;
      getKelurahanTujuan(value['id']);
    } else if (type == "kelurahan-tujuan") {
      kelurahanTujuanSelected.value = value;
    } else if (type == "klasifikasi-pindahan") {
      klasifikasiPindahanSelected.value = value;
    } else if (type == "jenis-pindahan") {
      jenisPindahanSelected.value = value;
    } else if (type == "status-kk-non-pindahan") {
      statusKKNonPindahSelected.value = value;
    }
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

      listKecamatanAsal.value = data;
      var initialKecamatan = data
          .where((element) => element['nama'] == personData['kecamatan'])
          .toList();
      kecamatanSelected.value = initialKecamatan[0];
      getKelurahan(initialKecamatan[0]["id"]);
    } else {
      listKecamatanAsal.value = [];
    }
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

      listKelurahanAsal.value = data;
      var initialKelurahan = data
          .where((element) => element['nama'] == personData['kelurahan'])
          .toList();

      kelurahanSelected.value =
          initialKelurahan.length > 0 ? initialKelurahan[0] : data[0];
    } else {
      listKelurahanAsal.value = [];
    }
    loading.value = false;
  }

  Future<dynamic> getKecamatanTujuan() async {
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

      listKecamatanTujuan.value = data;
      var initialKecamatan = data
          .where((element) => element['nama'] == personData['kecamatan'])
          .toList();
      kecamatanTujuanSelected.value = initialKecamatan[0];
      getKelurahanTujuan(initialKecamatan[0]["id"]);
    } else {
      listKecamatanTujuan.value = [];
    }
  }

  Future<dynamic> getKelurahanTujuan(String idKecamatan) async {
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

      listKelurahanTujuan.value = data;
      var initialKelurahan = data
          .where((element) => element['nama'] == personData['kelurahan'])
          .toList();

      kelurahanTujuanSelected.value =
          initialKelurahan.length > 0 ? initialKelurahan[0] : data[0];
    } else {
      listKelurahanTujuan.value = [];
    }
    loading.value = false;
  }

  Future<dynamic> getKlasifikasiPindahan() async {
    loading.value = true;
    Uri url = Uri.parse("$BASE_URL_API/pindahkeluar/klasifikasi-pindahan");
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

      listKlasifikasiPindahan.value = data;
      klasifikasiPindahanSelected.value = data[0];
    } else {
      listKlasifikasiPindahan.value = [];
    }
    loading.value = false;
  }

  Future<dynamic> getJenisPindahan() async {
    loading.value = true;
    Uri url = Uri.parse("$BASE_URL_API/pindahkeluar/jenis-pindahan");
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

      listJenisPindahan.value = data;
      jenisPindahanSelected.value = data[0];
    } else {
      listJenisPindahan.value = [];
    }
    loading.value = false;
  }

  Future<dynamic> getStatusKKNonPindah() async {
    loading.value = true;
    Uri url = Uri.parse("$BASE_URL_API/pindahkeluar/status-kk-non-pindahan");
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

      listStatusKKNonPindah.value = data;
      statusKKNonPindahSelected.value = data[0];
    } else {
      listStatusKKNonPindah.value = [];
    }
    loading.value = false;
  }

  void submit() {
    if (perpindahanKeluarFormKey.currentState!.validate()) {
      submitPerpindahanKeluar().then((res) {
        if (res.isNotEmpty) {
          Get.snackbar(
              "Berhasil", "Permohonan Perpindahan Keluar berhasil terkirim");
          Timer(Duration(seconds: 2), () {
            Get.offAndToNamed(Routes.HOME);
          });
        } else {
          Get.snackbar("Gagal", "Permohonan Perpindahan Keluar gagal terkirim");
        }
      });
    }
  }

  Future<dynamic> submitPerpindahanKeluar() async {
    Uri uri = Uri.parse("$BASE_URL_API/pindahkeluar");
    var res = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "Bearer ${getToken()}"
        },
        body: jsonEncode(<String, dynamic>{
          "nik_pemohon_id": nikPemohonController.text,
          "alamat_asal": alamatAsalController.text,
          "rt_asal": rtAsalController.text,
          "rw_asal": rwAsalController.text,
          "id_kelurahan_asal_id": kelurahanSelected.value['id'],
          "alamat_tujuan": alamatTujuanController.text,
          "rt_tujuan": rtTujuanController.text,
          "rw_tujuan": rwTujuanController.text,
          "id_kelurahan_tujuan_id": kelurahanTujuanSelected.value["id"],
          "klasifikasi_pindahan_id": klasifikasiPindahanSelected.value["id"],
          "jenis_pindahan_id": jenisPindahanSelected.value["id"],
          "status_kk_non_pindah_id": statusKKNonPindahSelected.value["id"],
          "alasan_pindah": alasanPindahController.text
        }));

        print(res.body);

    if (res.statusCode == 200) {
      Map<String, dynamic> data =
          (json.decode(res.body) as Map<String, dynamic>)["data"];
      loading.value = false;

      return data;
    } else {
      return {};
    }
  }
}
