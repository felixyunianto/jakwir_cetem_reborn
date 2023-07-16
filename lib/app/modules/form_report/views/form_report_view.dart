// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/form_report_controller.dart';

class FormReportView extends GetView<FormReportController> {
  const FormReportView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var data = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Akte Kematian'),
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
                    const Text("Akte Kematian"),
                    const SizedBox(
                      height: 12,
                    ),
                    Form(
                        key: controller.akterKemarinFormKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              validator: controller.validator,
                              controller: controller.nikController,
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
                                  labelText: "NIK",
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
                              controller: controller.dateController,
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2101));
                                if (pickedDate != null) {
                                  controller.dateController.text =
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
                                  labelText: "Tanggal Kematian",
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
                                      labelText: "Tempat Meninggal",
                                      contentPadding: EdgeInsets.all(10.0),
                                      hintStyle: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold)),
                                  hint: Text(
                                    'Tempat Meninggal',
                                  ),
                                  value: controller.tempatMatiSelected.value,
                                  onChanged: (newValue) {
                                    controller.selectedDropdown(
                                        "tempat-mati", newValue);
                                  },
                                  items: controller.listTempatMati.map((item) {
                                    return DropdownMenuItem(
                                      child: new Text(item['nama']),
                                      value: item,
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
                                      labelText: "Sebab Kematian",
                                      contentPadding: EdgeInsets.all(10.0),
                                      hintStyle: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold)),
                                  hint: Text(
                                    'Sebab Kematian',
                                  ),
                                  value: controller.sebabMatiSelected.value,
                                  onChanged: (newValue) {
                                    controller.selectedDropdown(
                                        "sebab-mati", newValue);
                                  },
                                  items: controller.listSebabMati.map((item) {
                                    return DropdownMenuItem(
                                      child: new Text(
                                        item['sebab'],
                                      ),
                                      value: item,
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
                                      labelText:
                                          "Yang Memberikan Keterangan Kematian",
                                      contentPadding: EdgeInsets.all(10.0),
                                      hintStyle: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold)),
                                  hint: Text(
                                    'Yang Memberikan Keterangan Kematian',
                                  ),
                                  value:
                                      controller.yangMenerangkanSelected.value,
                                  onChanged: (newValue) {
                                    controller.selectedDropdown(
                                        "yang-menerangkan", newValue);
                                  },
                                  items: controller.listYangMenerangkan
                                      .map((item) {
                                    return DropdownMenuItem(
                                      child: new Text(
                                        item['nama'],
                                      ),
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
                                        hintText: 'Upload File',
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
                                        print(platformFile.extension);
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
                            TextFormField(
                              validator: controller.validator,
                              controller: controller.noSuratController,
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
                                  labelText: "Nomor Surat Keterangan",
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
                              controller: controller.nikPelaporcontroller,
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
                            TextFormField(
                              validator: controller.validator,
                              controller: controller.hubPelaporController,
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
                                  labelText: "Hubungan Pelapor",
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
                            ElevatedButton(
                                onPressed: () {
                                  controller.submit();
                                },
                                child: Text("Kirim"))
                          ],
                        ))
                  ]))),
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
