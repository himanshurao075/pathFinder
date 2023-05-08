part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const home = _Paths.home;
  static const login = _Paths.login;
  static const initialPage = _Paths.initialPage;
  static const form = _Paths.form;
  static const template1 = _Paths.template1;
  static const template2 = _Paths.template2;
  static const template3 = _Paths.template3;
  static const modelsHome = _Paths.modelsHome;
  static const modelsForm = _Paths.modelsForm;
}

abstract class _Paths {
  _Paths._();
  static const home = '/home';
  static const initialPage = "/";
  static const login = "/login";
  static const form = "/form";
  static const template1 = "/template1";
  static const template2 = "/template2";
  static const template3 = "/template3";
  static const modelsHome = "/models";
  static const modelsForm = "/modelsform";
}
