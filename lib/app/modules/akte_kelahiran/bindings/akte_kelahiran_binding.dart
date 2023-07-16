import 'package:get/get.dart';

import '../controllers/akte_kelahiran_controller.dart';

class AkteKelahiranBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AkteKelahiranController>(
      () => AkteKelahiranController(),
    );
  }
}
