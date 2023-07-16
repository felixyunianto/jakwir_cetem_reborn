import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/form_kia_controller.dart';

class FormKiaView extends GetView<FormKiaController> {
  const FormKiaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var data = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text('KIA'),
        centerTitle: true,
      ),
      body: Stack(children: [
        Container(
            height: double.infinity,
            width: size.width,
            padding: const EdgeInsets.all(16),
            color: const Color(0xffF1F3F6),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("KIA (Kartu Identitas Anak)"),
                  const SizedBox(
                    height: 12,
                  ),
                  Form(
                    key: controller.kiaFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          validator: controller.validator,
                          controller: controller.nikPemohonController,
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
                              labelText: "NIK Pemohon",
                              contentPadding: EdgeInsets.all(10.0),
                              hintStyle: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        TextFormField(
                          validator: controller.validator,
                          controller: controller.nikAnakController,
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
                              labelText: "NIK Anak",
                              contentPadding: EdgeInsets.all(10.0),
                              hintStyle: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold)),
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
                                    String? extension = platformFile.extension;
                                    print(platformFile.extension);
                                    File file = File(result.files.single.path!);
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
                        ElevatedButton(
                            onPressed: () {
                              controller.submit();
                            },
                            child: Text("Kirim"))
                      ],
                    ),
                  )
                ],
              ),
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
      ]),
    );
  }
}
