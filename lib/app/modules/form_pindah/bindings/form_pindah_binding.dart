import 'package:get/get.dart';

import '../controllers/form_pindah_controller.dart';

class FormPindahBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FormPindahController>(
      () => FormPindahController(),
    );
  }
}
