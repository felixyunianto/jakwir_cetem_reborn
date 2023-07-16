import 'package:get/get.dart';

import '../controllers/usage_guide_controller.dart';

class UsageGuideBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UsageGuideController>(
      () => UsageGuideController(),
    );
  }
}
