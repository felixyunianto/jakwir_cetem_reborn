import 'package:get/get.dart';

class LayoutController extends GetxController {
  //TODO: Implement LayoutController

  var tabIndex = 0.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
