import 'package:get/get.dart';
import 'package:path_finder/Templates/templateOne.dart';
import 'package:path_finder/Templates/templateThree.dart';
import 'package:path_finder/Templates/templateTwo.dart';

import '../modules/Home/formView.dart';
import '../modules/Home/homeView.dart';
import '../modules/Home/home_binding.dart';
import '../modules/Login/loginView.dart';
import '../modules/Login/login_binding.dart';
import '../modules/model_input/models_binding.dart';
import '../modules/model_input/models_form.dart';
import '../modules/model_input/models_view.dart';
part './app_routes.dart';
class AppPages {
  AppPages._();  /// this is private constructor which make class non initialble.

  static const initial = Routes.login;

  static final routes = [
    GetPage(
      name: _Paths.modelsForm,
      page: () => const ModelsFormView(),
      binding: ModelsHomeBinding(),
    ),
     GetPage(
      name: _Paths.modelsHome,
      page: () => const ModelsHomeView(),
      binding: ModelsHomeBinding(),
    ),
    GetPage(
      name: _Paths.login,
      page: () => const LoginScreen(),   
      binding: LoginBinding(),   
     ),
   GetPage(
      page: () => const FormScreen(),
      name: _Paths.form,
      binding:  HomeBinding()
    ),
    GetPage(
      page: () => HomeScreen(),
      name: _Paths.home,
       binding: HomeBinding()
    ),
    GetPage(
      page: () => const TemplateOne(),
      name: _Paths.template1,
    ),
    GetPage(
      page: () => const TemplateTwo(),
      name: _Paths.template2,
    ),
    GetPage(
      page: () => const TemplateThree(),
      name: _Paths.template3,
    ), 
  ];
}
