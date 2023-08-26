// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jakwir_cetem_reborn/app/modules/common/cache_maanger.dart';
import 'package:jakwir_cetem_reborn/app/modules/common/navigation_drawer.dart';
import 'package:jakwir_cetem_reborn/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> with CacheManager{
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Row(
            children: [
              Container(
                padding: EdgeInsets.all(12),
                child: Image.asset("assets/images/logo-tegal.png"),
                width: 60,
              ),
              Text(
                ('Jakwir Cetem').toUpperCase(),
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Stack(
          children: [
            Image.asset(
              "assets/images/background.jpeg",
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            Container(
              color: Color.fromRGBO(0, 0, 0, 0.1),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 96,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 28),
                  child: Text(
                    "Halo, " + jsonDecode(getUser()!)['nama'],
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 28, vertical: 4),
                  child: Text(
                    "Selamat Datang di Jakwir Cetem",
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(
                        top: 24, left: 28, right: 24),
                    child: Text("Silahkan memilih menu pelayanan di bawah ini:",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold))),
                Flexible(
                  child: GridView.count(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    crossAxisCount: 2,
                    childAspectRatio: 1.2,
                    children: [
                      homeItem(
                          url: Routes.AKTE_KELAHIRAN,
                          label: "Akta Kelahiran",
                          image: "assets/images/kelahiran.png"),
                      homeItem(
                          url: Routes.AKTE_KEMATIAN,
                          label: "Akta Kematian",
                          image: "assets/images/kematian.png"),
                      homeItem(
                          url: Routes.KIA,
                          label: "KIA",
                          image: "assets/images/kia.png",
                          imageWidth: 80),
                      homeItem(
                          url: Routes.PERPINDAHAN_KELUAR,
                          label: "Perpindahan Keluar",
                          image: "assets/images/pindah.png"),
                    ],
                  ),
                ),
              ],
            )
          ],
        ));
  }

  GestureDetector homeItem(
      {required String url,
      required String label,
      required String image,
      double? imageWidth}) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(url);
      },
      child: Container(
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 231, 229, 229),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.2),
                  blurRadius: 8,
                  offset: Offset(2, 2), // Shadow position
                ),
              ],
              borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image,
                width: imageWidth != null ? imageWidth : 50,
              ),
              SizedBox(
                height: 10,
              ),
              Text(label)
            ],
          )),
    );
  }
}
