// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jakwir_cetem_reborn/app/modules/common/navigation_drawer.dart';
import 'package:jakwir_cetem_reborn/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavigationDrawer(),
        appBar: AppBar(
          title: const Text('Jakwir Cetem'),
          centerTitle: true,
          actions: [
            Container(
                padding: EdgeInsets.all(12),
                child: Image.asset("assets/images/logo-tegal.png"))
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding:
                    EdgeInsets.only(top: 16, left: 28, right: 24, bottom: 8),
                child: Text("Silahkan memilih menu pelayanan di bawah ini:",
                    style: TextStyle(
                        color: Color(0xff757C8E),
                        fontWeight: FontWeight.bold))),
            Flexible(
              child: GridView.count(
                padding: EdgeInsets.only(left: 16, right: 16),
                crossAxisCount: 1,
                childAspectRatio: 4,
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed(Routes.AKTE_KELAHIRAN);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff5193F2),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        textStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      child: Text("Akte Kelahiran"),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed(Routes.AKTE_KEMATIAN);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff5193F2),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        textStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      child: Text("Akte Kematian"),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed(Routes.KIA);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff5193F2),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        textStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      child: Text("KIA (Kartu Identitas Anak)"),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed(Routes.PERPINDAHAN_KELUAR);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff5193F2),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        textStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      child: Text("Perpindahan Keluar"),
                    ),
                  ),
                  // Container(
                  //   padding: EdgeInsets.all(8),
                  //   child: ElevatedButton(
                  //     onPressed: () {},
                  //     child: Text("Kartu Keluarga"),
                  //     style: ElevatedButton.styleFrom(
                  //       backgroundColor: const Color(0xff5193F2),
                  //       padding: const EdgeInsets.symmetric(vertical: 12),
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(24),
                  //       ),
                  //       textStyle: const TextStyle(
                  //         fontSize: 14,
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //   padding: EdgeInsets.all(8),
                  //   child: ElevatedButton(
                  //     onPressed: () {},
                  //     child: Text("KTP Elektronik"),
                  //     style: ElevatedButton.styleFrom(
                  //       backgroundColor: const Color(0xff5193F2),
                  //       padding: const EdgeInsets.symmetric(vertical: 12),
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(24),
                  //       ),
                  //       textStyle: const TextStyle(
                  //         fontSize: 14,
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ));
  }
}
