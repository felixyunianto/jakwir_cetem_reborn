import 'package:get/get.dart';

import '../controllers/akte_kematian_controller.dart';

class AkteKematianBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AkteKematianController>(
      () => AkteKematianController(),
    );
  }
}
