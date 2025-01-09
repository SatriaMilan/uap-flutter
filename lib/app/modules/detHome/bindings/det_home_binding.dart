import 'package:get/get.dart';

import '../controllers/det_home_controller.dart';

class DetHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetHomeController>(
      () => DetHomeController(),
    );
  }
}
