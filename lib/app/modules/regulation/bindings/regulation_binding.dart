import 'package:get/get.dart';

import '../controllers/regulation_controller.dart';

class RegulationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegulationController>(
      () => RegulationController(),
    );
  }
}
