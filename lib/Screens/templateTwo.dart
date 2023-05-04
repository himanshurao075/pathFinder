import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_finder/Providers/home.dart';
import 'package:path_finder/Timeline/style.dart';
import 'package:path_finder/Timeline/tile.dart';
import 'package:path_finder/Utils/colors.dart';
import 'package:path_finder/Utils/constants.dart';
import 'package:path_finder/Widgets/common.dart';
import 'package:collection/collection.dart';

class TemplateTwo extends StatelessWidget {
  const TemplateTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController c = Get.put(HomeController());
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
          return TimelineTile(
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
                    index: index,
                  ),
            startChild: isLeft
                ? BranchContainers(
                    model: process,
                    color: color,
                    isLeftBranch: isLeft,
                    index: index,
                  )
                : null,
          );
        },
      ),
    );
  }
}
