import 'package:get/get.dart';

import 'models_controller.dart';

class ModelsHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ModelsHomeController>(
      () => ModelsHomeController(),
    );
  }
}
