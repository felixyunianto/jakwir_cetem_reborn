import 'package:get/get.dart';

import '../controllers/form_kia_controller.dart';

class FormKiaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FormKiaController>(
      () => FormKiaController(),
    );
  }
}
