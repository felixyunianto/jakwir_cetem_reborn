import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakwir_cetem_reborn/app/contants/web_services.dart';
import 'package:http/http.dart' as http;
import 'package:jakwir_cetem_reborn/app/modules/common/cache_maanger.dart';
import 'package:jakwir_cetem_reborn/app/routes/app_pages.dart';

class FormReportKelahiranController extends GetxController with CacheManager {
  final loading = false.obs;

  final listTempatLahir = [].obs;
  final listJenisKelahiran = [].obs;
  final listKecamatan = [].obs;
  final listKelurahan = [].obs;
  final listPenolongKelahiran = [].obs;
  final listKecamatanPelapor = [].obs;
  final listKelurahanPelapor = [].obs;

  GlobalKey<FormState> akteKelahiranFormKey =
      GlobalKey<FormState>(debugLabel: '_akteKelahiranForm');

  final noSuratKeteranganLahirController = TextEditingController();
  final namaController = TextEditingController();
  final noKKController = TextEditingController();
  final tempatLahirSelected = {}.obs;
  final tanggalLahirController = TextEditingController();
  final jenisKelahiranController = {}.obs;
  final kelahiranKeController = TextEditingController();
  final kecamatanSelected = {}.obs;
  final kelurahanSelected = {}.obs;
  final penolongKelahiranSelected = {}.obs;
  final beratController = TextEditingController();
  final panjangController = TextEditingController();
  final noAktaNikahController = TextEditingController();
  final textSuratKelahiran = TextEditingController();
  final suratKelahiranVal = "".obs;
  final txtFilePicker = TextEditingController();
  final filePickerVal = "".obs;
  final kecamatanPelaporSelected = {}.obs;
  final kelurahanPelaporSelected = {}.obs;
  final nikBapakController = TextEditingController();
  final nikIbuController = TextEditingController();
  final nikSaksi1Controller = TextEditingController();
  final nikSaksi2Controller = TextEditingController();
  final nikPelaporController = TextEditingController();

  @override
  void onInit() {
    getTempatLahir();
    getJenisLahir();
    getKecamatan();
    getKecamatanPelapor();
    getPenolongKelahiran();
    super.onInit();
  }

  void selectedDropdown(String type, dynamic value) {
    if (type == 'tempat-lahir') {
      tempatLahirSelected.value = value;
    } else if (type == "jenis-lahir") {
      jenisKelahiranController.value = value;
    } else if (type == "jenis-lahir") {
      jenisKelahiranController.value = value;
    } else if (type == "kecamatan") {
      kecamatanSelected.value = value;
      getKelurahan(value['id']);
    } else if (type == "kelurahan") {
      kelurahanSelected.value = value;
    } else if (type == "penolong-lahir") {
      penolongKelahiranSelected.value = value;
    } else if (type == "kecamatan-pelapor") {
      kecamatanPelaporSelected.value = value;
      getKelurahanPelapor(value['id']);
    } else if (type == "kelurahan-pelapor") {
      kelurahanPelaporSelected.value = value;
    }
  }

  Future<dynamic> getTempatLahir() async {
    loading.value = true;
    Uri url = Uri.parse("$BASE_URL_API/aktakelahiran/tempat-lahir");
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
      listTempatLahir.value = data;
      tempatLahirSelected.value = data[0];
    } else {
      listTempatLahir.value = [];
    }
    loading.value = false;
  }

  Future<dynamic> getJenisLahir() async {
    loading.value = true;
    Uri url = Uri.parse("$BASE_URL_API/aktakelahiran/jenis-kelahiran");
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
      listJenisKelahiran.value = data;
      jenisKelahiranController.value = data[0];
    } else {
      listJenisKelahiran.value = [];
    }
    loading.value = false;
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
      kecamatanSelected.value = data[0];
      getKelurahan(data[0]["id"]);
    } else {
      listKecamatan.value = [];
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

      listKelurahan.value = data;

      kelurahanSelected.value = data[0];
    } else {
      listKelurahan.value = [];
    }
    loading.value = false;
  }

  Future<dynamic> getPenolongKelahiran() async {
    loading.value = true;
    Uri url = Uri.parse("$BASE_URL_API/aktakelahiran/penolong-kelahiran");
    var res = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer ${getToken()}"
      },
    );

    print(res.body);

    if (res.statusCode == 200) {
      List<dynamic> data =
          (json.decode(res.body) as Map<String, dynamic>)["data"];
      listPenolongKelahiran.value = data;
      penolongKelahiranSelected.value = data[0];
    } else {
      listPenolongKelahiran.value = [];
    }
    loading.value = false;
  }

  Future<dynamic> getKecamatanPelapor() async {
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

      listKecamatanPelapor.value = data;
      kecamatanPelaporSelected.value = data[0];
      getKelurahanPelapor(data[0]["id"]);
    } else {
      listKecamatanPelapor.value = [];
    }
  }

  Future<dynamic> getKelurahanPelapor(String idKecamatan) async {
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

      listKelurahanPelapor.value = data;

      kelurahanPelaporSelected.value = data[0];
    } else {
      listKelurahanPelapor.value = [];
    }
    loading.value = false;
  }

  String? validator(dynamic value) {
    if (value.isEmpty) {
      return 'Harus diisi';
    }
    return null;
  }

  void submit() {
    if (akteKelahiranFormKey.currentState!.validate()) {
      submitAkteKelahiran().then((res) {
        if (res != null) {
          Get.snackbar(
              "Berhasil", "Permohonan akta kelahiran berhasil terkirim");
          Timer(Duration(seconds: 2), () {
            Get.offAndToNamed(Routes.LAYOUT);
          });
        } else {
          Get.snackbar("Gagal", "Permohonan akta kelahiran gagal terkirim");
        }
      });
    }
  }

  Future<dynamic> submitAkteKelahiran() async {
    Uri url = Uri.parse("$BASE_URL_API/aktakelahiran");
    var res = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "Bearer ${getToken()}"
        },
        body: jsonEncode({
          'no_surat_keterangan_lahir': noSuratKeteranganLahirController.text,
          'nama': namaController.text,
          'nokk_id': noKKController.text,
          'tempat_lahir_id': tempatLahirSelected['id'],
          'tanggal_lahir': tanggalLahirController.text,
          'jenis_kelahiran_id': jenisKelahiranController['id'],
          'kelahiran_ke': kelahiranKeController.text,
          'id_kelurahan_id': kelurahanSelected['id'],
          'penolong_kelahiran_id': penolongKelahiranSelected['id'],
          'berat': int.parse(beratController.text),
          'panjang': int.parse(panjangController.text),
          "surat_keterangan_lahir": suratKelahiranVal.value,
          "akta_nikah": noAktaNikahController.text,
          "akta_nikah_img": filePickerVal.value,
          "id_kelurahan_lapor_id": kelurahanPelaporSelected['id'],
          "nik_bapak_id": nikBapakController.text,
          "nik_ibu_id": nikIbuController.text,
          "nik_saksi1_id": nikSaksi1Controller.text,
          "nik_saksi2_id": nikSaksi2Controller.text,
          "nik_pelapor_id": nikPelaporController.text
        }));

    if (res.statusCode == 200) {
      Map<String, dynamic> body =
          (json.decode(res.body) as Map<String, dynamic>);

      if (body['code'] == 200) {
        loading.value = false;
        return body;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }
}
