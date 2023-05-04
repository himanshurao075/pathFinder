import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_finder/Providers/home.dart';
import 'package:path_finder/Screens/Templates/templateOne.dart';
import 'package:path_finder/Utils/colors.dart';
import 'package:path_finder/Utils/constants.dart';
import 'package:collection/collection.dart';
import 'package:path_finder/Widgets/common.dart';
import 'Templates/templateThree.dart';
import 'Templates/templateTwo.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    Key? key,
  }) : super(key: key);

  final templates = [
    const TemplateOne(),
    const TemplateTwo(),
    const TemplateThree(),
  ];

  @override
  Widget build(BuildContext context) {
    final HomeController c = Get.put(HomeController());
    var myModel = c.selectedCareerModel;
    if (myModel.value == null) {
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                    3,
                    (index) => InkWell(
                      onTap: () {
                        c.onSelectedTemplate(index);
                      },
                      child: CircleAvatar(
                        child: Center(child: Text("${index + 1}")),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      myModel.value!.model.title,
                      style: TextStyle(
                          fontWeight: FontWeight.w700, color: headingColor),
                      textScaleFactor: 2,
                    )
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
                    data: myModel.value!.model.meaning,
                    color: Colors.blueGrey,
                  ),
                  BorderContainers(
                    title: "Scope",
                    data: myModel.value!.model.scope,
                    color: Colors.blueGrey,
                  ),
                  BorderContainers(
                    title: "Function",
                    data: myModel.value!.model.function,
                    color: Colors.blueGrey,
                  ),
                  BorderContainers(
                    title: "Package",
                    data: myModel.value!.model.package,
                    color: Colors.blueGrey,
                  ),
                  BorderContainers(
                    title: "Qualities",
                    data: myModel.value!.model.qualites,
                    color: Colors.blueGrey,
                  ),
                ][c.selectedTabIndex.value],
                const SizedBox(
                  height: 20,
                ),
                templates[c.selectedTemplate.value],
              ],
            ),
          );
        }),
      ),
    );
  }
}
