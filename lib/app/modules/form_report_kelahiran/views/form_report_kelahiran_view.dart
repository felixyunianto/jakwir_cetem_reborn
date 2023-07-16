// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/form_report_kelahiran_controller.dart';

class FormReportKelahiranView extends GetView<FormReportKelahiranController> {
  const FormReportKelahiranView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kelahiran'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
              height: double.infinity,
              width: size.width,
              padding: const EdgeInsets.all(16),
              color: const Color(0xffF1F3F6),
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Akte Kelahiran"),
                      const SizedBox(
                        height: 12,
                      ),
                      Form(
                        key: controller.akteKelahiranFormKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              validator: controller.validator,
                              controller:
                                  controller.noSuratKeteranganLahirController,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff5B5B5B),
                                  fontSize: 12),
                              decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5.0),
                                      ),
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 2)),
                                  labelText: "Nomor Surat Keterangan Lahir",
                                  contentPadding: EdgeInsets.all(10.0),
                                  hintStyle: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            TextFormField(
                              validator: controller.validator,
                              controller: controller.namaController,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff5B5B5B),
                                  fontSize: 12),
                              decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5.0),
                                      ),
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 2)),
                                  labelText: "Nama",
                                  contentPadding: EdgeInsets.all(10.0),
                                  hintStyle: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            TextFormField(
                              validator: controller.validator,
                              controller: controller.noKKController,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff5B5B5B),
                                  fontSize: 12),
                              decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5.0),
                                      ),
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 2)),
                                  labelText: "Nomor KK",
                                  contentPadding: EdgeInsets.all(10.0),
                                  hintStyle: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Obx(() => DropdownButtonFormField(
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff5B5B5B),
                                      fontSize: 12),
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5.0),
                                          ),
                                          borderSide: BorderSide(
                                              color: Colors.white, width: 2)),
                                      labelText: "Tempat Kelahiran",
                                      contentPadding: EdgeInsets.all(10.0),
                                      hintStyle: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold)),
                                  hint: Text(
                                    'Tempat Kelahiran',
                                  ),
                                  value: controller.tempatLahirSelected.value,
                                  onChanged: (newValue) {
                                    controller.selectedDropdown(
                                        "tempat-lahir", newValue);
                                  },
                                  items: controller.listTempatLahir.map((item) {
                                    return DropdownMenuItem(
                                      child: new Text(item['nama']),
                                      value: item,
                                    );
                                  }).toList(),
                                )),
                            SizedBox(
                              height: 12,
                            ),
                            TextFormField(
                              validator: controller.validator,
                              controller: controller.tanggalLahirController,
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2101));
                                if (pickedDate != null) {
                                  controller.tanggalLahirController.text =
                                      pickedDate.toIso8601String();
                                }
                              },
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff5B5B5B),
                                  fontSize: 12),
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5.0),
                                      ),
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 2)),
                                  labelText: "Tanggal Kelahiran",
                                  contentPadding: EdgeInsets.all(10.0),
                                  hintStyle: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Obx(() => DropdownButtonFormField(
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff5B5B5B),
                                      fontSize: 12),
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5.0),
                                          ),
                                          borderSide: BorderSide(
                                              color: Colors.white, width: 2)),
                                      labelText: "Jenis Kelahiran",
                                      contentPadding: EdgeInsets.all(10.0),
                                      hintStyle: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold)),
                                  hint: Text(
                                    'Jenis Kelahiran',
                                  ),
                                  value:
                                      controller.jenisKelahiranController.value,
                                  onChanged: (newValue) {
                                    controller.selectedDropdown(
                                        "jenis-lahir", newValue);
                                  },
                                  items:
                                      controller.listJenisKelahiran.map((item) {
                                    return DropdownMenuItem(
                                      child: new Text(item['nama']),
                                      value: item,
                                    );
                                  }).toList(),
                                )),
                            SizedBox(
                              height: 12,
                            ),
                            TextFormField(
                              validator: controller.validator,
                              controller: controller.kelahiranKeController,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff5B5B5B),
                                  fontSize: 12),
                              decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5.0),
                                      ),
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 2)),
                                  labelText: "Kelahiran Ke",
                                  contentPadding: EdgeInsets.all(10.0),
                                  hintStyle: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Obx(() => DropdownButtonFormField(
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff5B5B5B),
                                      fontSize: 12),
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5.0),
                                          ),
                                          borderSide: BorderSide(
                                              color: Colors.white, width: 2)),
                                      labelText: "Kecamatan",
                                      contentPadding: EdgeInsets.all(10.0),
                                      hintStyle: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold)),
                                  hint: Text(
                                    'Kecamatan',
                                  ),
                                  value: controller.kecamatanSelected.value,
                                  onChanged: (newValue) {
                                    controller.selectedDropdown(
                                        "kecamatan", newValue);
                                  },
                                  items:
                                      controller.listKecamatan.map((kecamatan) {
                                    return DropdownMenuItem(
                                      child: new Text(
                                        kecamatan['nama'],
                                      ),
                                      value: kecamatan,
                                    );
                                  }).toList(),
                                )),
                            SizedBox(
                              height: 12,
                            ),
                            Obx(() => DropdownButtonFormField(
                                  validator: controller.validator,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff5B5B5B),
                                      fontSize: 12),
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5.0),
                                          ),
                                          borderSide: BorderSide(
                                              color: Colors.white, width: 2)),
                                      labelText: "Kelurahan",
                                      contentPadding: EdgeInsets.all(10.0),
                                      hintStyle: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold)),
                                  hint: Text(
                                    'Kelurahan',
                                  ),
                                  value: controller.kelurahanSelected.value,
                                  onChanged: (newValue) {
                                    controller.selectedDropdown(
                                        "kelurahan", newValue);
                                  },
                                  items:
                                      controller.listKelurahan.map((kelurahan) {
                                    return DropdownMenuItem(
                                      child: new Text(
                                        kelurahan['nama'],
                                      ),
                                      value: kelurahan,
                                    );
                                  }).toList(),
                                )),
                            SizedBox(
                              height: 12,
                            ),
                            Obx(() => DropdownButtonFormField(
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff5B5B5B),
                                      fontSize: 12),
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5.0),
                                          ),
                                          borderSide: BorderSide(
                                              color: Colors.white, width: 2)),
                                      labelText: "Penolong Kelahiran",
                                      contentPadding: EdgeInsets.all(10.0),
                                      hintStyle: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold)),
                                  hint: Text(
                                    'Penolong Kelahiran',
                                  ),
                                  value: controller
                                      .penolongKelahiranSelected.value,
                                  onChanged: (newValue) {
                                    controller.selectedDropdown(
                                        "penolong-lahir", newValue);
                                  },
                                  items: controller.listPenolongKelahiran
                                      .map((item) {
                                    return DropdownMenuItem(
                                      child: new Text(item['nama']),
                                      value: item,
                                    );
                                  }).toList(),
                                )),
                            SizedBox(
                              height: 12,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    validator: controller.validator,
                                    controller: controller.beratController,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff5B5B5B),
                                        fontSize: 12),
                                    decoration: const InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(5.0),
                                            ),
                                            borderSide: BorderSide(
                                                color: Colors.white, width: 2)),
                                        labelText: "Berat Badan",
                                        contentPadding: EdgeInsets.all(10.0),
                                        hintStyle: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                                Expanded(
                                  child: TextFormField(
                                    validator: controller.validator,
                                    controller: controller.panjangController,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff5B5B5B),
                                        fontSize: 12),
                                    decoration: const InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(5.0),
                                            ),
                                            borderSide: BorderSide(
                                                color: Colors.white, width: 2)),
                                        labelText: "Panjang Bayi",
                                        contentPadding: EdgeInsets.all(10.0),
                                        hintStyle: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            TextFormField(
                              validator: controller.validator,
                              controller: controller.noAktaNikahController,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff5B5B5B),
                                  fontSize: 12),
                              decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5.0),
                                      ),
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 2)),
                                  labelText: "No Akta Nikah",
                                  contentPadding: EdgeInsets.all(10.0),
                                  hintStyle: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                      readOnly: true,
                                      validator: (String? value) {
                                        if (value == null || value.isEmpty) {
                                          return 'File harus diupload';
                                        } else {
                                          return null;
                                        }
                                      },
                                      controller: controller.textSuratKelahiran,
                                      decoration: const InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(5.0),
                                            ),
                                            borderSide: BorderSide(
                                                color: Colors.white, width: 2)),
                                        hintText: 'Surat Kelahiran',
                                        contentPadding: EdgeInsets.all(10.0),
                                      ),
                                      style: const TextStyle(fontSize: 12.0)),
                                ),
                                const SizedBox(width: 5),
                                ElevatedButton.icon(
                                  icon: const Icon(
                                    Icons.upload_file,
                                    color: Colors.white,
                                    size: 24.0,
                                  ),
                                  label: const Text('Pilih File',
                                      style: TextStyle(fontSize: 16.0)),
                                  onPressed: () async {
                                    FilePickerResult? result =
                                        await FilePicker.platform.pickFiles(
                                            type: FileType.custom,
                                            allowedExtensions: [
                                          "jpg",
                                          "jpeg",
                                          'pdf'
                                        ]);
                                    if (result != null) {
                                      controller.textSuratKelahiran.text =
                                          result.files.single.name;
                                      if (result != null) {
                                        PlatformFile platformFile =
                                            result.files.first;
                                        String? extension =
                                            platformFile.extension;
                                        File file =
                                            File(result.files.single.path!);
                                        result.files.single.bytes;
                                        List<int> fileInByte =
                                            file.readAsBytesSync();

                                        String fileInBase64 =
                                            base64Encode(fileInByte);
                                        controller.suratKelahiranVal.value =
                                            'data:@file/$extension;base64,$fileInBase64';
                                      }
                                      // var base64img = base64Encode(bytes);
                                    } else {
                                      // User canceled the picker
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(122, 48),
                                    maximumSize: const Size(122, 48),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                      readOnly: true,
                                      validator: (String? value) {
                                        if (value == null || value.isEmpty) {
                                          return 'File harus diupload';
                                        } else {
                                          return null;
                                        }
                                      },
                                      controller: controller.txtFilePicker,
                                      decoration: const InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(5.0),
                                            ),
                                            borderSide: BorderSide(
                                                color: Colors.white, width: 2)),
                                        hintText: 'Akta Nikah',
                                        contentPadding: EdgeInsets.all(10.0),
                                      ),
                                      style: const TextStyle(fontSize: 12.0)),
                                ),
                                const SizedBox(width: 5),
                                ElevatedButton.icon(
                                  icon: const Icon(
                                    Icons.upload_file,
                                    color: Colors.white,
                                    size: 24.0,
                                  ),
                                  label: const Text('Pilih File',
                                      style: TextStyle(fontSize: 16.0)),
                                  onPressed: () async {
                                    FilePickerResult? result =
                                        await FilePicker.platform.pickFiles(
                                            type: FileType.custom,
                                            allowedExtensions: [
                                          "jpg",
                                          "jpeg",
                                          'pdf'
                                        ]);
                                    if (result != null) {
                                      controller.txtFilePicker.text =
                                          result.files.single.name;
                                      if (result != null) {
                                        PlatformFile platformFile =
                                            result.files.first;
                                        String? extension =
                                            platformFile.extension;
                                        File file =
                                            File(result.files.single.path!);
                                        result.files.single.bytes;
                                        List<int> fileInByte =
                                            file.readAsBytesSync();

                                        String fileInBase64 =
                                            base64Encode(fileInByte);
                                        controller.filePickerVal.value =
                                            'data:@file/$extension;base64,$fileInBase64';
                                      }
                                      // var base64img = base64Encode(bytes);
                                    } else {
                                      // User canceled the picker
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(122, 48),
                                    maximumSize: const Size(122, 48),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Obx(() => DropdownButtonFormField(
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff5B5B5B),
                                      fontSize: 12),
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5.0),
                                          ),
                                          borderSide: BorderSide(
                                              color: Colors.white, width: 2)),
                                      labelText: "Kecamatan Pelapor",
                                      contentPadding: EdgeInsets.all(10.0),
                                      hintStyle: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold)),
                                  hint: Text(
                                    'Kecamatan Pelapor',
                                  ),
                                  value:
                                      controller.kecamatanPelaporSelected.value,
                                  onChanged: (newValue) {
                                    controller.selectedDropdown(
                                        "kecamatan-pelapor", newValue);
                                  },
                                  items: controller.listKecamatanPelapor
                                      .map((kecamatan) {
                                    return DropdownMenuItem(
                                      child: new Text(
                                        kecamatan['nama'],
                                      ),
                                      value: kecamatan,
                                    );
                                  }).toList(),
                                )),
                            SizedBox(
                              height: 12,
                            ),
                            Obx(() => DropdownButtonFormField(
                                  validator: controller.validator,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff5B5B5B),
                                      fontSize: 12),
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5.0),
                                          ),
                                          borderSide: BorderSide(
                                              color: Colors.white, width: 2)),
                                      labelText: "Kelurahan Pelapor",
                                      contentPadding: EdgeInsets.all(10.0),
                                      hintStyle: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold)),
                                  hint: Text(
                                    'Kelurahan Pelapor',
                                  ),
                                  value:
                                      controller.kelurahanPelaporSelected.value,
                                  onChanged: (newValue) {
                                    controller.selectedDropdown(
                                        "kelurahan-pelapor", newValue);
                                  },
                                  items: controller.listKelurahanPelapor
                                      .map((kelurahan) {
                                    return DropdownMenuItem(
                                      child: new Text(
                                        kelurahan['nama'],
                                      ),
                                      value: kelurahan,
                                    );
                                  }).toList(),
                                )),
                            SizedBox(
                              height: 12,
                            ),
                            TextFormField(
                              validator: controller.validator,
                              controller: controller.nikBapakController,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff5B5B5B),
                                  fontSize: 12),
                              decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5.0),
                                      ),
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 2)),
                                  labelText: "NIK Ayah",
                                  contentPadding: EdgeInsets.all(10.0),
                                  hintStyle: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            TextFormField(
                              validator: controller.validator,
                              controller: controller.nikIbuController,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff5B5B5B),
                                  fontSize: 12),
                              decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5.0),
                                      ),
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 2)),
                                  labelText: "NIK Ibu",
                                  contentPadding: EdgeInsets.all(10.0),
                                  hintStyle: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            TextFormField(
                              validator: controller.validator,
                              controller: controller.nikSaksi1Controller,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff5B5B5B),
                                  fontSize: 12),
                              decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5.0),
                                      ),
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 2)),
                                  labelText: "NIK Saksi 1",
                                  contentPadding: EdgeInsets.all(10.0),
                                  hintStyle: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            TextFormField(
                              validator: controller.validator,
                              controller: controller.nikSaksi2Controller,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff5B5B5B),
                                  fontSize: 12),
                              decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5.0),
                                      ),
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 2)),
                                  labelText: "NIK Saksi 2",
                                  contentPadding: EdgeInsets.all(10.0),
                                  hintStyle: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            TextFormField(
                              validator: controller.validator,
                              controller: controller.nikPelaporController,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff5B5B5B),
                                  fontSize: 12),
                              decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5.0),
                                      ),
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 2)),
                                  labelText: "NIK Pelapor",
                                  contentPadding: EdgeInsets.all(10.0),
                                  hintStyle: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  controller.submit();
                                },
                                child: Text("Kirim"))
                          ],
                        ),
                      )
                    ]),
              )),
          Obx((() => Visibility(
              visible: controller.loading.value,
              child: Positioned(
                top: 0,
                left: 0,
                bottom: 0,
                right: 0,
                child: Container(
                  color: Colors.black12,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
              ))))
        ],
      ),
    );
  }
}
