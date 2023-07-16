import 'package:get/get.dart';

import '../controllers/kia_controller.dart';

class KiaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KiaController>(
      () => KiaController(),
    );
  }
}
