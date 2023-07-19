import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/form_pindah_controller.dart';

class FormPindahView extends GetView<FormPindahController> {
  const FormPindahView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Perpindahan Keluar'),
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
                  const Text("Perpindahan Keluar"),
                  const SizedBox(
                    height: 12,
                  ),
                  Form(
                    key: controller.perpindahanKeluarFormKey,
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
                        const SizedBox(
                          height: 12,
                        ),
                        TextFormField(
                          validator: controller.validator,
                          controller: controller.alamatAsalController,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff5B5B5B),
                              fontSize: 12),
                          maxLines: 6,
                          textAlignVertical: TextAlignVertical.top,
                          decoration: const InputDecoration(
                              alignLabelWithHint: true,
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5.0),
                                  ),
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 2)),
                              labelText: "Alamat sebelumnya",
                              contentPadding: EdgeInsets.all(10.0),
                              hintStyle: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold)),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        TextFormField(
                          maxLength: 2,
                          validator: controller.validator,
                          controller: controller.rtAsalController,
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
                              labelText: "RT Sebelumnya",
                              contentPadding: EdgeInsets.all(10.0),
                              hintStyle: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold)),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        TextFormField(
                          maxLength: 2,
                          validator: controller.validator,
                          controller: controller.rwAsalController,
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
                              labelText: "RW Sebelumnya",
                              contentPadding: EdgeInsets.all(10.0),
                              hintStyle: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Obx(() => DropdownButtonFormField(
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
                                  labelText: "Kecamatan Sebelumnya",
                                  contentPadding: EdgeInsets.all(10.0),
                                  hintStyle: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold)),
                              hint: const Text(
                                'Kecamatan Sebelumnya',
                              ),
                              value: controller.kecamatanSelected.value,
                              onChanged: (newValue) {
                                controller.selectedDropdown(
                                    "kecamatan", newValue);
                              },
                              items:
                                  controller.listKecamatanAsal.map((kecamatan) {
                                return DropdownMenuItem(
                                  child: new Text(
                                    kecamatan['nama'],
                                  ),
                                  value: kecamatan,
                                );
                              }).toList(),
                            )),
                        const SizedBox(
                          height: 12,
                        ),
                        Obx(() => DropdownButtonFormField(
                              validator: controller.validator,
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
                                  labelText: "Kelurahan Sebelumnya",
                                  contentPadding: EdgeInsets.all(10.0),
                                  hintStyle: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold)),
                              hint: const Text(
                                'Kelurahan Sebelumnya',
                              ),
                              value: controller.kelurahanSelected.value,
                              onChanged: (newValue) {
                                controller.selectedDropdown(
                                    "kelurahan", newValue);
                              },
                              items:
                                  controller.listKelurahanAsal.map((kelurahan) {
                                return DropdownMenuItem(
                                  child: new Text(
                                    kelurahan['nama'],
                                  ),
                                  value: kelurahan,
                                );
                              }).toList(),
                            )),
                        const SizedBox(
                          height: 12,
                        ),
                        TextFormField(
                          validator: controller.validator,
                          controller: controller.alamatTujuanController,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff5B5B5B),
                              fontSize: 12),
                          maxLines: 6,
                          textAlignVertical: TextAlignVertical.top,
                          decoration: const InputDecoration(
                              alignLabelWithHint: true,
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5.0),
                                  ),
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 2)),
                              labelText: "Alamat tujuan",
                              contentPadding: EdgeInsets.all(10.0),
                              hintStyle: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold)),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        TextFormField(
                          maxLength: 2,
                          validator: controller.validator,
                          controller: controller.rtTujuanController,
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
                              labelText: "RT Tujuan",
                              contentPadding: EdgeInsets.all(10.0),
                              hintStyle: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold)),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        TextFormField(
                          maxLength: 2,
                          validator: controller.validator,
                          controller: controller.rwTujuanController,
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
                              labelText: "RW Tujuan",
                              contentPadding: EdgeInsets.all(10.0),
                              hintStyle: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Obx(() => DropdownButtonFormField(
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
                                  labelText: "Kecamatan Tujuan",
                                  contentPadding: EdgeInsets.all(10.0),
                                  hintStyle: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold)),
                              hint: const Text(
                                'Kecamatan Tujuan',
                              ),
                              value: controller.kecamatanTujuanSelected.value,
                              onChanged: (newValue) {
                                controller.selectedDropdown(
                                    "kecamatan-tujuan", newValue);
                              },
                              items: controller.listKecamatanTujuan
                                  .map((kecamatan) {
                                return DropdownMenuItem(
                                  child: new Text(
                                    kecamatan['nama'],
                                  ),
                                  value: kecamatan,
                                );
                              }).toList(),
                            )),
                        const SizedBox(
                          height: 12,
                        ),
                        Obx(() => DropdownButtonFormField(
                              validator: controller.validator,
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
                                  labelText: "Kelurahan Tujuan",
                                  contentPadding: EdgeInsets.all(10.0),
                                  hintStyle: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold)),
                              hint: const Text(
                                'Kelurahan Tujuan',
                              ),
                              value: controller.kelurahanTujuanSelected.value,
                              onChanged: (newValue) {
                                controller.selectedDropdown(
                                    "kelurahan-tujuan", newValue);
                              },
                              items: controller.listKelurahanTujuan
                                  .map((kelurahan) {
                                return DropdownMenuItem(
                                  child: new Text(
                                    kelurahan['nama'],
                                  ),
                                  value: kelurahan,
                                );
                              }).toList(),
                            )),
                        const SizedBox(
                          height: 12,
                        ),
                        Obx(() => DropdownButtonFormField(
                              validator: controller.validator,
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
                                  labelText: "Klasifikasi Pindahan",
                                  contentPadding: EdgeInsets.all(10.0),
                                  hintStyle: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold)),
                              hint: const Text(
                                'Klasifikasi Pindahan',
                              ),
                              value:
                                  controller.klasifikasiPindahanSelected.value,
                              onChanged: (newValue) {
                                controller.selectedDropdown(
                                    "klasifikasi-pindahan", newValue);
                              },
                              items: controller.listKlasifikasiPindahan
                                  .map((item) {
                                return DropdownMenuItem(
                                  child: new Text(
                                    item['nama'],
                                  ),
                                  value: item,
                                );
                              }).toList(),
                            )),
                        const SizedBox(
                          height: 12,
                        ),
                        Obx(() => DropdownButtonFormField(
                              validator: controller.validator,
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
                                  labelText: "Jenis Pindahan",
                                  contentPadding: EdgeInsets.all(10.0),
                                  hintStyle: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold)),
                              hint: const Text(
                                'Jenis Pindahan',
                              ),
                              value: controller.jenisPindahanSelected.value,
                              onChanged: (newValue) {
                                controller.selectedDropdown(
                                    "jenis-pindahan", newValue);
                              },
                              items: controller.listJenisPindahan.map((item) {
                                return DropdownMenuItem(
                                  child: new Text(
                                    item['nama'],
                                  ),
                                  value: item,
                                );
                              }).toList(),
                            )),
                        const SizedBox(
                          height: 12,
                        ),
                        Obx(() => DropdownButtonFormField(
                              validator: controller.validator,
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
                                  labelText: "Status KK Non Pindah",
                                  contentPadding: EdgeInsets.all(10.0),
                                  hintStyle: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold)),
                              hint: const Text(
                                'Status KK Non Pindah',
                              ),
                              value: controller.statusKKNonPindahSelected.value,
                              onChanged: (newValue) {
                                controller.selectedDropdown(
                                    "status-kk-non-pindahan", newValue);
                              },
                              items:
                                  controller.listStatusKKNonPindah.map((item) {
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
                        TextFormField(
                          validator: controller.validator,
                          controller: controller.alasanPindahController,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff5B5B5B),
                              fontSize: 12),
                          maxLines: 6,
                          textAlignVertical: TextAlignVertical.top,
                          decoration: const InputDecoration(
                              alignLabelWithHint: true,
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5.0),
                                  ),
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 2)),
                              labelText: "Alasan Pindah",
                              contentPadding: EdgeInsets.all(10.0),
                              hintStyle: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold)),
                        ),
                        const SizedBox(
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
              ))),
        ]));
  }
}
