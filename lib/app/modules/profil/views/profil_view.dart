import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jakwir_cetem_reborn/app/modules/common/authentication_manager.dart';
import 'package:jakwir_cetem_reborn/app/modules/common/cache_maanger.dart';
import 'package:jakwir_cetem_reborn/app/routes/app_pages.dart';

import '../controllers/profil_controller.dart';

class ProfilView extends GetView<ProfilController> with CacheManager {
  const ProfilView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    AuthenticationManager authenticationManager = AuthenticationManager();
    return Scaffold(
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
      ),
      body: Container(
        height: double.infinity,
        width: size.width,
        padding: EdgeInsets.all(24),
        child: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              width: size.width,
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ]),
              child: Column(children: [
                Text(
                  jsonDecode(getUser()!)["nama"].toUpperCase(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.credit_card,
                          size: 26,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "NIK",
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                            Text(
                              jsonDecode(getUser()!)["nik"],
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        )
                      ],
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Icon(
                          Icons.mail_outline,
                          size: 26,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Email",
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                            Text(
                              jsonDecode(getUser()!)["email"] + 
                              "",
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                )
              ]),
            ),
            SizedBox(
              height: 24,
            ),
            Container(
                margin: EdgeInsets.only(bottom: 8),
                padding: EdgeInsets.symmetric(vertical: 8),
                width: size.width,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1, color: Colors.grey),
                  ),
                ),
                child: Row(
                  children: [
                    Text("Syarat dan Ketentuan"),
                    Spacer(),
                    Icon(Icons.chevron_right)
                  ],
                )),
            Container(
                margin: EdgeInsets.only(bottom: 8),
                padding: EdgeInsets.symmetric(vertical: 8),
                width: size.width,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1, color: Colors.grey),
                  ),
                ),
                child: Row(
                  children: [
                    Text("Kebijakan dan Privasi"),
                    Spacer(),
                    Icon(Icons.chevron_right)
                  ],
                )),
            Container(
                margin: EdgeInsets.only(bottom: 8),
                padding: EdgeInsets.symmetric(vertical: 8),
                width: size.width,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1, color: Colors.grey),
                  ),
                ),
                child: Row(
                  children: [
                    Text("Tentang Aplikasi"),
                    Spacer(),
                    Icon(Icons.chevron_right)
                  ],
                )),
            GestureDetector(
              onTap: () {
                Get.offAndToNamed(Routes.LOGIN);
                authenticationManager.logOut();
              },
              child: Container(
                  margin: EdgeInsets.only(bottom: 8),
                  padding: EdgeInsets.symmetric(vertical: 8),
                  width: size.width,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 1, color: Colors.grey),
                    ),
                  ),
                  child: Row(
                    children: [
                      Text(
                        "Keluar",
                        style: TextStyle(color: Colors.red),
                      ),
                      Spacer(),
                      Icon(Icons.logout, size: 16, color: Colors.red,)
                    ],
                  )),
            ),
          ],
        )),
      ),
    );
  }
}
