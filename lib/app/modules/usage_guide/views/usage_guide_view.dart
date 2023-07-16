// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jakwir_cetem_reborn/app/modules/common/navigation_drawer.dart';
import 'package:jakwir_cetem_reborn/app/modules/usage_guide/views/components/tab_four.dart';
import 'package:jakwir_cetem_reborn/app/modules/usage_guide/views/components/tab_one.dart';
import 'package:jakwir_cetem_reborn/app/modules/usage_guide/views/components/tab_three.dart';
import 'package:jakwir_cetem_reborn/app/modules/usage_guide/views/components/tab_two.dart';

import '../controllers/usage_guide_controller.dart';

class UsageGuideView extends GetView<UsageGuideController> {
  const UsageGuideView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
        body: Container(
          height: double.infinity,
          width: size.width,
          alignment: Alignment.center,
          color: Color(0xffF1F3F6),
          child: SingleChildScrollView(
              child: Container(
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        blurRadius: 2,
                        spreadRadius: 1,
                        color: Colors.black.withOpacity(.2),
                        offset: Offset(0, 2))
                  ]),
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    children: [
                      DefaultTabController(
                          length: 4,
                          initialIndex: 0,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                SizedBox(
                                  width: size.width * 0.4,
                                  child: TabBar(
                                    labelColor: Colors.green,
                                    indicatorColor: Colors.green,
                                    unselectedLabelColor: Colors.black,
                                    isScrollable: true,
                                    tabs: [
                                      Tab(
                                          icon: Icon(
                                        Icons.person_add,
                                        size: 18,
                                      )),
                                      Tab(
                                          icon: Icon(
                                        Icons.person,
                                        size: 18,
                                      )),
                                      Tab(
                                          icon: Icon(
                                        Icons.description_sharp,
                                        size: 18,
                                      )),
                                      Tab(
                                          icon: Icon(
                                        Icons.phone,
                                        size: 18,
                                      )),
                                    ],
                                  ),
                                ),
                                Container(
                                    height: size.height,
                                    padding: EdgeInsets.symmetric(vertical: 20),
                                    child: TabBarView(children: <Widget>[
                                      TabOne(),
                                      TabTwo(),
                                      TabThree(),
                                      TabFour(),
                                    ]))
                              ]))
                    ],
                  ))),
        ));
  }
}
