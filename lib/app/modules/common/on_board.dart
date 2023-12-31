import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakwir_cetem_reborn/app/modules/common/authentication_manager.dart';
import 'package:jakwir_cetem_reborn/app/modules/home/views/home_view.dart';
import 'package:jakwir_cetem_reborn/app/modules/layout/views/layout_view.dart';
import 'package:jakwir_cetem_reborn/app/modules/login/views/login_view.dart';

class OnBoard extends StatelessWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthenticationManager authManager = Get.find();

    return Obx(() {
      return authManager.isLogged.value
          ? const LayoutView()
          : const LoginView();
    });
  }
}
