import 'package:get/get.dart';

import '../controllers/menumakanan_controller.dart';

class MenumakananBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MenumakananController>(
      () => MenumakananController(),
    );
  }
}
