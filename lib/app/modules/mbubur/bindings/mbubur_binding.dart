import 'package:get/get.dart';

import '../controllers/mbubur_controller.dart';

class MbuburBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MbuburController>(
      () => MbuburController(),
    );
  }
}
