// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:jakwir_cetem_reborn/app/modules/usage_guide/views/components/list_item_tab.dart';

class TabOne extends StatefulWidget {
  const TabOne({super.key});

  @override
  State<TabOne> createState() => _TabOneState();
}

class _TabOneState extends State<TabOne> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
    const ListItemTab(
        textOne: "Siapa yang dapat melakukan pendaftaran ?",
        child: Text(
            "Yang dapat melakukan pendaftaran adalah warga yang terdaftar di database kependudukan Kota Tegal dan berusia 17 tahun ke atas.",
            style: TextStyle(
              fontSize: 12,
            ))),
    const SizedBox(height: 20),
    const ListItemTab(
        textOne:
            "Apa yang perlu dipersiapkan sebelum melakukan pendaftaran ?",
        child: Text("Nomor NIK dan Nomor HP yang Aktif.",
            style: TextStyle(
              fontSize: 12,
            ))),
    const SizedBox(height: 20),
    const ListItemTab(
        textOne: "Bagaimana jika NIK saya tidak terdaftar ?",
        child: Text(
            "Jika NIK tidak terdaftar cek kembali NIK pada KTP-el dan Kartu Keluarga dipastikan harus sama. Atau dapat langusng ke Dinas Kependudukan dan Pencatatan Sipil Kota Tegal untuk konfirmasi.",
            style: TextStyle(
              fontSize: 12,
            ))),
    const SizedBox(height: 20),
    const ListItemTab(
        textOne:
            "Bagaimana jika muncul peringatan NIK sudah terdaftar padahal saya belum pernah melakukan pendaftaran ?",
        child: Text(
            "Silahkan datang ke Dinas Kependudukan dan Pencatatan Sipil Kota Tegal dengan membawa Asli KTP dan Kartu Keluarga untuk pengecekan dan konfirmasi data.",
            style: TextStyle(
              fontSize: 12,
            ))),
      ],
    );
  }
}
