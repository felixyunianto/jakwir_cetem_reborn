import 'package:get/get.dart';

import '../controllers/form_report_kelahiran_controller.dart';

class FormReportKelahiranBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FormReportKelahiranController>(
      () => FormReportKelahiranController(),
    );
  }
}
