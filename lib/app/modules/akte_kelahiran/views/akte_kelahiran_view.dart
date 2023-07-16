// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jakwir_cetem_reborn/app/routes/app_pages.dart';

import '../controllers/akte_kelahiran_controller.dart';

class AkteKelahiranView extends GetView<AkteKelahiranController> {
  const AkteKelahiranView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Jakwir Cetem'),
          centerTitle: true,
          actions: [
            Container(
                padding: const EdgeInsets.all(12),
                child: Image.asset("assets/images/logo-tegal.png"))
          ],
        ),
        body: Container(
            height: double.infinity,
            width: size.width,
            padding: const EdgeInsets.all(16),
            color: const Color(0xffF1F3F6),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Pelaporan Baru"),
                  const SizedBox(
                    height: 12,
                  ),
                  formKK(),
                  const SizedBox(
                    height: 12,
                  ),
                  Obx((() => Visibility(
                      visible: controller.familyList.isNotEmpty ? true : false,
                      child: listkk(context))))
                ],
              ),
            )));
  }

  Container listkk(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Pilih data yang akan dilaporkan kelahirannya:",
            style: TextStyle(fontSize: 12),
          ),
          const SizedBox(
            height: 12,
          ),
          ...List.generate(controller.familyList.length, ((index) {
            return (Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '${index + 1}',
                      style: const TextStyle(fontSize: 12),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      (controller.familyList.value[index]["nama"])
                          .toUpperCase(),
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                SizedBox(
                  height: 24,
                  child: ElevatedButton(
                      onPressed: () {
                        Get.offAndToNamed(Routes.FORM_REPORT_KELAHIRAN,
                            arguments: [controller.familyList[index], null]);
                      },
                      child: const Text(
                        "+ LAPOR",
                        style: TextStyle(fontSize: 10),
                      )),
                ),
                const SizedBox(
                  height: 8,
                ),
              ],
            ));
          })),
          const Divider(),
          const Text(
            "Bayi belum mempunyai NIK?",
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(
            height: 6,
          ),
          SizedBox(
            height: 37,
            child: Form(
              key: controller.babyNoNIKFormKey,
              child: TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp('[0-9.,]+')),
                ],
                validator: controller.validatorBabyNoNIK,
                controller: controller.nikBabyNoNIK,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101));
                  if (pickedDate != null) {
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate);
                    controller.nikBabyNoNIK.text = formattedDate;
                  }
                },
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff5B5B5B),
                    fontSize: 12),
                decoration: const InputDecoration(
                    filled: false,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelText: "Masukkan tanggal Lahir (Hari-Bulan-Tahun)",
                    hintStyle:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                controller.submitBabyNoNIK();
              },
              child: const Text(
                "+ LAPOR",
              )),
        ],
      ),
    );
  }

  Container formKK() {
    return Container(
      padding: const EdgeInsets.all(18),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Data KK",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              )),
          const SizedBox(
            height: 10,
          ),
          const Text("Nomor KK",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              )),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 37,
            child: Form(
              key: controller.kKFormKey,
              child: TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp('[0-9.,]+')),
                ],
                validator: controller.validator,
                controller: controller.kkController,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff5B5B5B),
                    fontSize: 12),
                decoration: const InputDecoration(
                    filled: false,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelText: "No. KK",
                    hintStyle:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 80,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff5193F2),
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          textStyle: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          controller.doFindKK();
                        },
                        child: const Text("Mulai")),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 80,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          textStyle: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          controller.resetFindKK();
                        },
                        child: const Text("Reset")),
                  )
                ],
              ),
              const Spacer(),
              SizedBox(
                width: 100,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      textStyle: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      Get.offAndToNamed(Routes.HOME);
                    },
                    child: const Text("Kembali")),
              )
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Obx((() => Visibility(
              visible: controller.familyList.value.isNotEmpty ? true : false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  itemFormKk(
                      "Nama Kepala Keluarga",
                      controller.familyList.value.isNotEmpty
                          ? controller.familyList.value[0]['nama']
                          : ""),
                  const SizedBox(
                    height: 12,
                  ),
                  itemFormKk(
                      "Kecamatan",
                      controller.familyList.value.isNotEmpty
                          ? controller.familyList.value[0]['kecamatan']
                          : ""),
                  const SizedBox(
                    height: 12,
                  ),
                  itemFormKk(
                      "Desa/Kelurahan",
                      controller.familyList.value.isNotEmpty
                          ? controller.familyList.value[0]['kelurahan']
                          : ""),
                  const SizedBox(
                    height: 12,
                  ),
                  itemFormKk(
                      "RT/RW",
                      controller.familyList.value.isNotEmpty
                          ? "${controller.familyList.value[0]['rt']}/${controller.familyList.value[0]['rw']}"
                          : ""),
                ],
              )))),
        ],
      ),
    );
  }

  Column itemFormKk(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 12),
        ),
        const SizedBox(
          height: 3,
        ),
        Text(
          value.toUpperCase(),
          style: const TextStyle(fontSize: 12),
        )
      ],
    );
  }
}
