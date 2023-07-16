import 'package:get/get.dart';
import 'package:jakwir_cetem_reborn/app/modules/common/authentication_manager.dart';
import 'package:jakwir_cetem_reborn/app/modules/common/cache_maanger.dart';

class SplashScreenController extends GetxController with CacheManager {
  final AuthenticationManager _authenticationManager =
      Get.put(AuthenticationManager());

  Future<void> initializeSettings() async {
    _authenticationManager.checkLoginStatus();

    //Simulate other services for 3 seconds
    await Future.delayed(const Duration(seconds: 3));
  }
}
