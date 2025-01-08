import 'package:get/get.dart';

import '../controllers/akstivitas_controller.dart';

class AkstivitasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AkstivitasController>(
      () => AkstivitasController(),
    );
  }
}
