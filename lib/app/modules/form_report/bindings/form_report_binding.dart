import 'package:get/get.dart';

import '../controllers/form_report_controller.dart';

class FormReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FormReportController>(
      () => FormReportController(),
    );
  }
}
