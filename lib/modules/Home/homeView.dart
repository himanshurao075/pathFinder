import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_finder/Templates/templateOne.dart';
import 'package:path_finder/Utils/colors.dart';
import 'package:path_finder/Utils/constants.dart';
import 'package:collection/collection.dart';
import 'package:path_finder/Widgets/common.dart';
import 'package:path_finder/modules/Home/homeController.dart';
import '../../Templates/templateThree.dart';
import '../../Templates/templateTwo.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  // TODO: implement controller
  HomeController get c => super.controller;
  @override
  Widget build(BuildContext context) {
    if (c.selectedCareerModel.value == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return DefaultTabController(
      length: 5,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: Colors.white,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Obx(() {
          return SingleChildScrollView(
            controller: c.scrollController.value,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        c.selectedCareerModel.value!.model.title,
                        style: TextStyle(
                            fontWeight: FontWeight.w700, color: headingColor),
                        textScaleFactor: 2,
                      ),
                      PopupMenuButton<int>(
                          onSelected: (value) {
                            c.onSelectedTemplate(value);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                            color: Colors.teal,
                            
                              borderRadius: BorderRadius.circular(30)),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text("Select Pattern",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),textScaleFactor: 1,),
                            )),
                          itemBuilder: (_) =>
                              ["Pattern 1", "Pattern 2", "Pattern 3"]
                                  .mapIndexed((index, e) => PopupMenuItem<int>(
                                        value: index,
                                        child: Text(e),
                                      ))
                                  .toList())
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TabBar(
                      indicatorColor: NewCustomColorPlatte().blueColor,
                      indicatorWeight: 3.0,
                      onTap: (value) {
                        c.selectedTabIndex.value = value;
                      },
                      tabs: tabBarLabel
                          .mapIndexed((index, e) => Tab(
                                child: Text(
                                  e,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: NewCustomColorPlatte().pink,
                                  ),
                                ),
                              ))
                          .toList()),
                  const SizedBox(
                    height: 20,
                  ),
                  [
                    BorderContainers(
                      title: "Meaning",
                      data: c.selectedCareerModel.value!.model.meaning,
                      color: Colors.blueGrey,
                    ),
                    BorderContainers(
                      title: "Scope",
                      data: c.selectedCareerModel.value!.model.scope,
                      color: Colors.blueGrey,
                    ),
                    BorderContainers(
                      title: "Function",
                      data: c.selectedCareerModel.value!.model.function,
                      color: Colors.blueGrey,
                    ),
                    BorderContainers(
                      title: "Package",
                      data: c.selectedCareerModel.value!.model.package,
                      color: Colors.blueGrey,
                    ),
                    BorderContainers(
                      title: "Qualities",
                      data: c.selectedCareerModel.value!.model.qualites,
                      color: Colors.blueGrey,
                    ),
                  ][c.selectedTabIndex.value],
                  const SizedBox(
                    height: 20,
                  ),
                  c.templates[c.selectedTemplate.value],
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
