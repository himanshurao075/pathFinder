import 'package:get/get.dart';
import 'package:path_finder/modules/Home/homeController.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
