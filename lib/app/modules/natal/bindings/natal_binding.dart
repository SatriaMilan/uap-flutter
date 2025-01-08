import 'package:get/get.dart';

import '../controllers/natal_controller.dart';

class NatalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NatalController>(
      () => NatalController(),
    );
  }
}
