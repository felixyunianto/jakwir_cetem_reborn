import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jakwir_cetem_reborn/app/modules/home/bindings/home_binding.dart';
import 'package:jakwir_cetem_reborn/app/modules/login/controllers/login_controller.dart';
import 'package:jakwir_cetem_reborn/app/routes/app_pages.dart';
import 'package:get/get.dart';

void main() async {
  await GetStorage.init();
  Get.put(LoginController());
  runApp(const MyApp());
}

Map<int, Color> color = {
  50: const Color.fromRGBO(91, 147, 196, .1),
  100: const Color.fromRGBO(91, 147, 196, .2),
  200: const Color.fromRGBO(91, 147, 196, .3),
  300: const Color.fromRGBO(91, 147, 196, .4),
  400: const Color.fromRGBO(91, 147, 196, .5),
  500: const Color.fromRGBO(91, 147, 196, .6),
  600: const Color.fromRGBO(91, 147, 196, .7),
  700: const Color.fromRGBO(91, 147, 196, .8),
  800: const Color.fromRGBO(91, 147, 196, .9),
  900: const Color.fromRGBO(91, 147, 196, 1),
};

MaterialColor colorCustom = MaterialColor(0xFF5B93C4, color);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  
  

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jakwir Cetem',
      theme: ThemeData(primarySwatch: colorCustom),
      initialBinding: HomeBinding(),
      initialRoute: Routes.SPLASH_SCREEN,
      getPages: AppPages.routes,
    );
  }
}
