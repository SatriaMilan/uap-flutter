import 'package:get/get.dart';

import '../controllers/newyear_controller.dart';

class NewyearBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewyearController>(
      () => NewyearController(),
    );
  }
}
