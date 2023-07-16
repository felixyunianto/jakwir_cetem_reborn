// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:jakwir_cetem_reborn/app/modules/usage_guide/views/components/list_item_tab.dart';

class TabTwo extends StatefulWidget {
  const TabTwo({super.key});

  @override
  State<TabTwo> createState() => _TabTwoState();
}

class _TabTwoState extends State<TabTwo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
    const ListItemTab(
        textOne: "Apa itu pelapor ?",
        child: Text(
            "Pelapor merupakan warga yang sudah berhasil melakukan pendafaran dan akan melakukan pelaporan Akta Kelahiran, Akta Kematian, dan lain-lain tergantung pelayanan yang disediakan.",
            style: TextStyle(
              fontSize: 12,
            ))),
    const SizedBox(height: 20),
    const ListItemTab(
        textOne: "Bagaimana mengubah dan melihat data saya(pelapor) ?",
        child: Text(
            "Buka halaman Profil Pelapor nanti akan ditampilkan NIK, Nama Lengkap, Nomor HP, dan Alamat Email. Data yang dapat dirubah adalah Nomor HP dan Alamat Email.",
            style: TextStyle(
              fontSize: 12,
            ))),
      ],
    );
  }
}
