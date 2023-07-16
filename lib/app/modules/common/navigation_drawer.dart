// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jakwir_cetem_reborn/app/modules/common/authentication_manager.dart';
// ignore: depend_on_referenced_packages
import 'package:jakwir_cetem_reborn/app/routes/app_pages.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color(0xFF1856B4),
        child: ListView(children: [
          buildDrawerHeader(),
          buildDrawerItem(
              icon: Icons.home,
              text: "Halaman Utama",
              onTap: () => navigate(0),
              tileColor: Get.currentRoute == Routes.HOME || Get.currentRoute == Routes.SPLASH_SCREEN
                  ? Colors.white
                  : const Color(0xFF1856B4),
              textIconColor: Get.currentRoute == Routes.HOME || Get.currentRoute == Routes.SPLASH_SCREEN
                  ? Colors.black
                  : Colors.white),
          buildDrawerItem(
              icon: Icons.view_stream_rounded,
              text: "Persyaratan",
              onTap: () => navigate(1),
              tileColor: Get.currentRoute == Routes.REGULATION
                  ? Colors.white
                  : const Color(0xFF1856B4),
              textIconColor: Get.currentRoute == Routes.REGULATION
                  ? Colors.black
                  : Colors.white),
          buildDrawerItem(
              icon: Icons.auto_awesome_mosaic_outlined,
              text: "Panduan Penggunaan",
              onTap: () => navigate(2),
              tileColor: Get.currentRoute == Routes.USAGE_GUIDE
                  ? Colors.white
                  : const Color(0xFF1856B4),
              textIconColor: Get.currentRoute == Routes.USAGE_GUIDE
                  ? Colors.black
                  : Colors.white),
          
          buildDrawerItem(
              icon: Icons.login_rounded,
              text: "Keluar Akun",
              onTap: () => navigate(3),
              tileColor: const Color(0xFF1856B4),
              textIconColor: Colors.white),
        ]),
      ),
    );
  }

  Widget buildDrawerHeader() {
    return UserAccountsDrawerHeader(
      decoration: BoxDecoration(color: Colors.white),
      accountName: Text("Bongkrek",
          style:
              TextStyle(color: Color(0xFF454444), fontWeight: FontWeight.bold)),
      accountEmail: Text("bongkrekoioi@gmail.com",
          style: TextStyle(color: Color(0xFF2D2D2D))),
      currentAccountPictureSize: Size(135, 93),
      currentAccountPicture: Container(
        padding: EdgeInsets.only(bottom: 8),
        child: Image(image: AssetImage('assets/images/dukcapil-logo.png'), fit: BoxFit.cover),
      ),
    );
  }

  Widget buildDrawerItem({
    required String text,
    required IconData icon,
    required Color textIconColor,
    required Color? tileColor,
    required VoidCallback onTap,
  }) {
    
    return Material(
      child: ListTile(
        visualDensity: VisualDensity(horizontal: 0, vertical: -2),
        leading: Icon(icon, color: textIconColor),
        title: Text(
          text,
          style: TextStyle(color: textIconColor, fontSize: 14),
        ),
        tileColor: tileColor,
        onTap: onTap,
      ),
    );
  }

  navigate(int index) {
    AuthenticationManager authenticationManager = AuthenticationManager();
    if (index == 0) {
      Get.offAndToNamed(Routes.HOME);
    } else if (index == 1) {
      Get.offAndToNamed(Routes.REGULATION);
    } else if (index == 2) {
      Get.offAndToNamed(Routes.USAGE_GUIDE);
    }else if( index == 3) {
      Get.offAndToNamed(Routes.LOGIN);
      authenticationManager.logOut();
    }
  }
}
