import 'package:get/get.dart';

import '../controllers/perpindahan_keluar_controller.dart';

class PerpindahanKeluarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PerpindahanKeluarController>(
      () => PerpindahanKeluarController(),
    );
  }
}
