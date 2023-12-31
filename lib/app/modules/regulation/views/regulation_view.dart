import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jakwir_cetem_reborn/app/modules/common/navigation_drawer.dart';
import 'package:jakwir_cetem_reborn/app/modules/regulation/data/regulation.dart';

import '../controllers/regulation_controller.dart';

class RegulationView extends GetView<RegulationController> {
  const RegulationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
          Container(
            height: double.infinity,
            width: size.width,
            margin: EdgeInsets.only(top: 100),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  numberedListRegulation(akteKelahiranData, "NUMBER_LIST"),
                  numberedListRegulation(akteKematian, "NUMBER_LIST"),
                  numberedListRegulation(perpindahanKeluar, "NUMBER_LIST"),
                  numberedListRegulation(kartuIdentitasAnak, "NUMBER_LIST"),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  ExpansionTile numberedListRegulation(Map<String, dynamic> data, String type) {
    if (type == "NUMBER_LIST") {
      return ExpansionTile(
        title: Text(
          data["title"],
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Align(
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(data['children'].length, (index) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${index + 1}",
                        style: const TextStyle(height: 2, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                          child: Text(
                        data['children'][index],
                        style: const TextStyle(height: 2, fontWeight: FontWeight.w500),
                      ))
                    ],
                  );
                }),
              ),
            ),
          ),
        ],
      );
    } else {
      return ExpansionTile(
        title: Text(data["title"]),
        children: [
          Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(data["children"].length, (index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            data["children"][index]["label"],
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, height: 2),
                          ),
                          Column(
                            children: List.generate(
                                data["children"][index]["child"].length,
                                (indexChild) {
                              return Container(
                                padding: const EdgeInsets.only(left: 8),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${indexChild + 1}",
                                      style: const TextStyle(height: 2),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Expanded(
                                        child: Text(
                                      data["children"][index]["child"]
                                          [indexChild],
                                      style: const TextStyle(height: 2),
                                    ))
                                  ],
                                ),
                              );
                            }),
                          )
                        ],
                      );
                    }),
                  )))
        ],
      );
    }
  }
}
