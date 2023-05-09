import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_finder/Templates/templateOne.dart';
import 'package:path_finder/Utils/colors.dart';
import 'package:path_finder/Utils/constants.dart';
import 'package:collection/collection.dart';
import 'package:path_finder/Widgets/common.dart';
import 'package:path_finder/modules/Home/homeController.dart';
import '../../Models/DataModel.dart';
import '../../Templates/templateThree.dart';
import '../../Templates/templateTwo.dart';
import '../../Timeline/style.dart';
import '../../Timeline/tile.dart';
import 'dart:js' as js;


class ModelsHomeScreen extends StatefulWidget {
  ModelsHomeScreen({
    Key? key,
    required this.model
  }) : super(key: key);
  final CarrerModel model;

  @override
  State<ModelsHomeScreen> createState() => _ModelsHomeScreenState();
}

class _ModelsHomeScreenState extends State<ModelsHomeScreen> {

  @override
  Widget build(BuildContext context) {
    // if (c.selectedCareerModel.value == null) {
    //   return const Center(
    //     child: CircularProgressIndicator(),
    //   );
    // }
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SingleChildScrollView(
          // controller: c.scrollController.value,
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
                      widget.model.title,
                      style: TextStyle(
                          fontWeight: FontWeight.w700, color: headingColor),
                      textScaleFactor: 2,
                    ),
                      ],
                ),
                const SizedBox(
                  height: 20,
                ),
                
                ...[
                  BorderContainers(
                    title: "Meaning",
                    data: widget.model.meaning,
                    color: Colors.blueGrey,
                  ),
                  SizedBox(height: 20,),
                  BorderContainers(
                    title: "Scope",
                    data: widget.model.scope,
                    color: Colors.blueGrey,
                  ),
                  SizedBox(
                  height: 20,
                ),

                 

                  BorderContainers(
                    title: "Package",
                    data: widget.model.package,
                    color: Colors.blueGrey,
                  ),
                  SizedBox(
                  height: 20,
                ),
                BorderContainers(
                  title: "Function",
                  data: widget.model.function,
                  color: Colors.blueGrey,
                ),
                SizedBox(
                  height: 20,
                ),
                  BorderContainers(
                    title: "Qualities",
                    data: widget.model.qualites,
                    color: Colors.blueGrey,
                  ),

                ],
                const SizedBox(
                  height: 20,
                ),
               Column(
    children: List.generate(
      widget.model.proccess.length,
      (index) {
        final isLeft = index % 2 != 0;
        final isLastIndex = index ==widget.model.proccess.length - 1;
        final color = NewCustomColorPlatte().getRowColor(index: index);
        final lightColor =
            NewCustomColorPlatte().getColorWithShade50(index: index);
        final process = widget.model.proccess[index];
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
    )
,
              ],
            ),
          ),
        )
    ,
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

  final Proccess model;
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
                                        if (source.type.icon != null)
                                          Icon(source.type.icon),
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
