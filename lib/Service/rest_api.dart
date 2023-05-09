//Create a file: rest_api.dart

import 'package:get/get.dart';

class RestAPI {
  final GetConnect connect = Get.find<GetConnect>();

  //GET request example
  Future<dynamic> getRequest(String url) async {
    Response response = await connect.get(url);
    if (response.statusCode == 200) {
      return response;
    } else {
      return null;
    }
  }

  //post request example
  Future<dynamic> postRequest(
      String url, Map<String, dynamic> jsonBody) async {
    //body data
    // FormData formData = FormData(jsonBody);

    Response response = await connect.post(url, jsonBody);
    if (response.statusCode == 200) {
      return response;
    } else {
      return null;
    }
  }
}

abstract class API_URLS {
  API_URLS._();
  static const baseUrl = 'http://216.48.177.242:8083';
  static const fetchModel = "$baseUrl/fetchCarrerModel";
  static const addModel = "$baseUrl/addCarrerModel";
}
