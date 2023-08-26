import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:jakwir_cetem_reborn/app/modules/home/views/home_view.dart';
import 'package:jakwir_cetem_reborn/app/modules/profil/views/profil_view.dart';
import 'package:jakwir_cetem_reborn/app/modules/regulation/views/regulation_view.dart';
import 'package:jakwir_cetem_reborn/app/modules/usage_guide/views/usage_guide_view.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class BottomNavCustom extends StatelessWidget {
  const BottomNavCustom({super.key});

  @override
  Widget build(BuildContext context) {
    PersistentTabController _controller;

    _controller = PersistentTabController(initialIndex: 0);

    List<Widget> _buildScreen() {
      return [HomeView(), RegulationView(), UsageGuideView(), ProfilView()];
    }

    List<PersistentBottomNavBarItem> _navBarItems() {
      return [
        PersistentBottomNavBarItem(
            icon: Icon(Icons.home),
            title: ("Home"),
            activeColorPrimary: Color(0xFF5B93C4),
            inactiveColorPrimary: Colors.grey),
        PersistentBottomNavBarItem(
            icon: Icon(Icons.view_stream_rounded),
            title: ("Syarat"),
            activeColorPrimary: Color.fromARGB(255, 91, 147, 196),
            inactiveColorPrimary: Colors.grey),
        PersistentBottomNavBarItem(
            icon: Icon(Icons.auto_awesome_mosaic_outlined),
            title: ("Panduan"),
            activeColorPrimary: Color.fromARGB(255, 91, 147, 196),
            inactiveColorPrimary: Colors.grey),
        PersistentBottomNavBarItem(
            icon: Icon(Icons.person),
            title: ("Profil"),
            activeColorPrimary: Color.fromARGB(255, 91, 147, 196),
            inactiveColorPrimary: Colors.grey),
      ];
    }

    ;
    return PersistentTabView(
      context,
      screens: _buildScreen(),
      controller: _controller,
      items: _navBarItems(),
      confineInSafeArea: true,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(16),
        colorBehindNavBar: Color.fromARGB(255, 91, 147, 196),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            blurRadius: 8,
            offset: Offset(0, 0), // Shadow position
          ),
        ],
      ),
      margin: EdgeInsets.all(24),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(microseconds: 500), curve: Curves.ease),
      screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(microseconds: 500)),
      navBarStyle: NavBarStyle.style9,
    );
  }
}
