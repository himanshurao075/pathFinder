import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_finder/Service/api_dependency.dart';
import 'package:path_finder/routes/app_pages.dart';

void main() {
  DependencyInjection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      title: "Path Finder",
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    );
    // return MaterialApp.router(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //   ),
    //   debugShowCheckedModeBanner: false,
    //   routeInformationParser: router.routeInformationParser,
    //   routerDelegate: router.routerDelegate,
    //   routeInformationProvider: router.routeInformationProvider,
    // );
  }
}
