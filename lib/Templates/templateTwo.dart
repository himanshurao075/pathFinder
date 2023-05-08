import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_finder/Models/DataModel.dart';
import 'package:path_finder/Timeline/style.dart';
import 'package:path_finder/Timeline/tile.dart';
import 'package:path_finder/Utils/colors.dart';
import 'dart:js' as js;

import 'package:path_finder/modules/Home/homeController.dart';

import '../Widgets/buttons.dart';

class TemplateTwo extends GetView<HomeController> {
  const TemplateTwo({Key? key}) : super(key: key);
  @override
  HomeController get c => super.controller;
  @override
  Widget build(BuildContext context) {
    var myModel = c.selectedCareerModel;
    if (myModel.value == null) {
      return const Center(child: CircularProgressIndicator());
    }
    return Column(
      children: List.generate(
        myModel.value!.model.proccess.length,
        (index) {
          final isLeft = index % 2 != 0;
          final isLastIndex = index == myModel.value!.model.proccess.length - 1;
          final color = NewCustomColorPlatte().getRowColor(index: index);
          final lightColor =
              NewCustomColorPlatte().getColorWithShade50(index: index);
          final process = myModel.value!.model.proccess[index];
          return Column(
            children: [
              TimelineTile(
                alignment: TimelineAlign.center,
                isLast: isLastIndex,
                beforeLineStyle:
                    LineStyle(color: Colors.brown.shade200, thickness: 15),
                afterLineStyle:
                    LineStyle(color: Colors.brown.shade200, thickness: 15),
                indicatorStyle: IndicatorStyle(
                    width: 40,
                    height: 40,
                    indicatorXY: 0.5,
                    indicator: CircleAvatar(
                        // radius: 23,
                        backgroundColor: color,
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: CircleAvatar(
                              // radius: 20,
                              backgroundColor: lightColor,
                              child: process.prefixIcon == null
                                  ? Text(
                                      "${index + 1}",
                                      style: TextStyle(
                                          color: color,
                                          fontWeight: FontWeight.bold),
                                    )
                                  : Icon(
                                      process.prefixIcon,
                                      color: color,
                                    )
                              //
                              ),
                        ))),
                endChild: isLeft
                    ? null
                    : BranchContainers(
                        isLeftBranch: isLeft,
                        model: process,
                        color: color,
                      ),
                startChild: isLeft
                    ? BranchContainers(
                        model: process,
                        color: color,
                        isLeftBranch: isLeft,
                      )
                    : null,
              ),
              
              
            ],
          );
        },
      ),
    );
  }
}

class BranchContainers extends StatelessWidget {
  const BranchContainers({
    super.key,
    required this.model,
    required this.color,
    required this.isLeftBranch,
  });

  final Process model;
  final MaterialColor color;
  final bool isLeftBranch;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (!isLeftBranch)
          Container(
            width: 100,
            height: 3,
            color: color,
          ),
        Expanded(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Color(color.value),
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: EdgeInsets.only(
                      // bottom: 3.0,
                      right: isLeftBranch ? 3.0 : 0,
                      left: isLeftBranch ? 0 : 3),
                  child: Container(
                      decoration: BoxDecoration(
                          color: color.shade50,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5))),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              model.title,
                              style:
                                  const TextStyle(fontWeight: FontWeight.w900),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              model.description,
                              style:
                                  const TextStyle(fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Divider(
                              color: color,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 2.0),
                              child: Wrap(
                                spacing: 10,
                                runSpacing: 5,
                                children: List.generate(model.sources.length,
                                    (index) {
                                  final source = model.sources[index];
                                  return InkWell(
                                    onTap: () async {
                                      js.context.callMethod(
                                        "open",
                                        [source.link],
                                      );
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        if (source.prefix != null)
                                          source.prefix!,
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          source.title,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                }),
                              ),
                            )
                          ],
                        ),
                      )),
                ),
              ),
              // SizedBox(height: 5,),
              // Expanded(
              //   child: Container( decoration: BoxDecoration(color: color.shade50,borderRadius: BorderRadius.circular(5)),
              //     child: Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: Row(
              //         mainAxisSize: MainAxisSize.min,
              //         children: [
              //           Text("FDsdfs"),
              //         ],
              //       ),
              //     ),),
              // )
            ],
          ),
        ),
        if (isLeftBranch)
          Container(
            width: 100,
            height: 3,
            color: color,
          ),
      ],
    );
  }
}
