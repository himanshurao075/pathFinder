import 'package:get/get.dart';
import 'package:path_finder/Service/rest_api.dart';

class DependencyInjection {
  static void init() async {
    Get.put<GetConnect>(GetConnect()); //initializing GetConnect
    Get.put<RestAPI>(RestAPI());
  }
}
