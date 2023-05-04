import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:path_finder/Screens/formscreen.dart';
import 'package:path_finder/Routings/pages.dart';
import 'package:path_finder/Screens/homescreen.dart';
import 'package:path_finder/Screens/loginscreen.dart';
import 'package:path_finder/Screens/templateOne.dart';
import 'package:path_finder/Screens/templateTwo.dart';

GoRouter router = GoRouter(
  initialLocation: AppPages.login,
  routes: [
    GoRoute(
      path: AppPages.login,
      name: AppPages.login,
      builder: (BuildContext context, GoRouterState state) {
        return const LoginScreen();
      },
      routes: [
        GoRoute(
          path: AppPages.form,
          name: AppPages.form,
          builder: (BuildContext context, GoRouterState state) {
            return const FormScreen();
          },
        ),
        GoRoute(
          path: AppPages.home,
          name: AppPages.home,
          builder: (BuildContext context, GoRouterState state) {
            return HomeScreen();
          },
        ),
        GoRoute(
          path: AppPages.details1,
          name: AppPages.details1,
          builder: (BuildContext context, GoRouterState state) {
            return const TemplateOne();
          },
        ),
        GoRoute(
          path: AppPages.details2,
          name: AppPages.details2,
          builder: (BuildContext context, GoRouterState state) {
            return const TemplateTwo();
          },
        )
      ],
    ),
  ],
);
