import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_finder/Models/DataModel.dart';
import 'package:path_finder/Utils/colors.dart';
import 'dart:js' as js;

import 'package:path_finder/modules/Home/homeController.dart';

import '../Widgets/common.dart';

class TemplateThree extends GetView<HomeController> {
  const TemplateThree({Key? key}) : super(key: key);
@override
  HomeController get c => super.controller;
  @override
  Widget build(BuildContext context) {
    var myModel = c.selectedCareerModel;
    if (myModel.value == null) {
      return const Center(child: CircularProgressIndicator());
    }
    double radius = 10;
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      child: Column(
        children: List.generate(
          myModel.value!.model.proccess.length,
          (index) {
            final isLeft = index % 2 != 0;
            final isLastIndex =
                index == myModel.value!.model.proccess.length - 1;
            final color = NewCustomColorPlatte().getRowColor(index: index);
            final lightColor =
                NewCustomColorPlatte().getColorWithShade50(index: index);
            final process = myModel.value!.model.proccess[index];
            final isStart = index == 0;
            return Column(
              children: [
                Container(
                  // height: MediaQuery.of(context).size.height * 0.25,
                  decoration: BoxDecoration(
                    color: Colors.brown.shade200,
                    borderRadius: BorderRadius.vertical(
                      top: isStart ? Radius.circular(radius) : Radius.zero,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: isLeft ? radius : 0,
                        bottom: 0,
                        right: isLeft ? 0 : radius),
                    child: Container(
                      
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: isStart
                                    ? Radius.zero
                                    : isLeft
                                        ? Radius.circular(radius)
                                        : Radius.zero,
                                bottomLeft: isLeft
                                    ? Radius.circular(radius)
                                    : Radius.zero,
                                topRight: !isLeft
                                    ? Radius.circular(radius)
                                    : Radius.zero,
                                bottomRight: !isLeft
                                    ? Radius.circular(radius)
                                    : Radius.zero)),
                        child: BranchContainers(
                          color: color,
                          index: index,
                          isLeftBranch: isLeft,
                          model: process,
                        )),
                  ),
                ),
                Container(
                  height: radius,
                  // duration: Duration(seconds: 1),
                  decoration: BoxDecoration(
                      color: Colors.brown.shade200,
                      borderRadius: BorderRadius.only(
                          topLeft:
                              isLeft ? Radius.zero : Radius.circular(radius),
                          bottomLeft: isLastIndex
                              ? Radius.circular(radius)
                              : isLeft
                                  ? Radius.circular(radius)
                                  : Radius.zero,
                          topRight:
                              !isLeft ? Radius.zero : Radius.circular(radius),
                          bottomRight:
                              !isLeft ? Radius.circular(radius) : Radius.zero)),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

// class BranchContainers extends StatefulWidget {
//   const BranchContainers({
//     super.key,
//     required this.index,
//     required this.model,
//     required this.color,
//     required this.isLeftBranch,
//   });

//   final int index;
//   final Proccess model;
//   final MaterialColor color;
//   final bool isLeftBranch;

//   @override
//   State<BranchContainers> createState() => _BranchContainersState();
// }

// class _BranchContainersState extends State<BranchContainers> {
//   double aniWidth = 0;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     Future.delayed(const Duration(milliseconds: 200), () {
//       aniWidth = 35;
//       setState(() {});
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 100),
//       child: Row(
//         children: [
//           Expanded(
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 if (widget.isLeftBranch)
//                   BranchIconBar(
//                     aniWidth: aniWidth,
//                     color: widget.color,
//                     index: widget.index,
//                     model: widget.model,
//                   ),
//                 Expanded(
//                   child: Row(
//                     mainAxisAlignment: widget.isLeftBranch
//                         ? MainAxisAlignment.start
//                         : MainAxisAlignment.end,
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Container(
//                         decoration: BoxDecoration(
//                             color: Color(widget.color.value),
//                             borderRadius: BorderRadius.circular(15)),
//                         child: Padding(
//                           padding: EdgeInsets.only(
//                               bottom: 3.0,
//                               right: widget.isLeftBranch ? 3.0 : 0,
//                               left: widget.isLeftBranch ? 0 : 3),
//                           child: Container(
//                               decoration: BoxDecoration(
//                                   color: widget.color.shade50,
//                                   borderRadius: const BorderRadius.all(
//                                       Radius.circular(12))),
//                               child: Padding(
//                                 padding: const EdgeInsets.all(16.0),
//                                 child: Column(
//                                   mainAxisSize: MainAxisSize.min,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       widget.model.title,
//                                       style: const TextStyle(
//                                           fontWeight: FontWeight.w900),
//                                     ),
//                                     const SizedBox(
//                                       height: 10,
//                                     ),
//                                     Row(children: [
//                                       Text(
//                                         widget.model.description,
//                                         style: const TextStyle(
//                                             fontWeight: FontWeight.w500),
//                                       ),
//                                     ]),
//                                     const SizedBox(
//                                       height: 20,
//                                     ),
//                                     Divider(
//                                       color: widget.color,
//                                       height: 5,
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.symmetric(
//                                           vertical: 2.0),
//                                       child: Wrap(
//                                         spacing: 10,
//                                         runSpacing: 5,
//                                         children: List.generate(
//                                             widget.model.sources.length,
//                                             (index) {
//                                           final source =
//                                               widget.model.sources[index];
//                                           return InkWell(
//                                             onTap: () async {
//                                               if (source.type ==
//                                                       MediaType.pdf ||
//                                                   source.type ==
//                                                       MediaType.image ||
//                                                   source.type ==
//                                                       MediaType.audio) {
//                                                 js.context.callMethod(
//                                                     "open", [source.link]);
//                                                 // html.AnchorElement
//                                                 //     anchorElement =
//                                                 //     new html.AnchorElement(
//                                                 //         href: source.link);
//                                                 // anchorElement.download =
//                                                 //     source.link;
//                                                 // anchorElement.click();
//                                               }

//                                               if (source.type ==
//                                                   MediaType.link) {
//                                                 js.context.callMethod(
//                                                     "open", [source.link]);
//                                               }
//                                             },
//                                             child: Row(
//                                               mainAxisSize: MainAxisSize.min,
//                                               children: [
//                                                 if (source.type.icon != null)
//                                                   Icon(source.type.icon),
//                                                 const SizedBox(
//                                                   width: 5,
//                                                 ),
//                                                 Text(
//                                                   source.title,
//                                                   style: const TextStyle(
//                                                     fontWeight: FontWeight.w500,
//                                                   ),
//                                                 )
//                                               ],
//                                             ),
//                                           );
//                                         }),
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               )),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 if (!widget.isLeftBranch)
//                   BranchIconBar(
//                     aniWidth: aniWidth,
//                     color: widget.color,
//                     index: widget.index,
//                     model: widget.model,
//                   ),
//               ],
//             ),
//           ),
//           // if (widget.isLeftBranch)
//           //   Expanded(
//           //     child: SizedBox(),
//           //   ),
//         ],
//       ),
//     );
//   }
// }

// class BranchIconBar extends StatelessWidget {
//   const BranchIconBar({
//     super.key,
//     required this.aniWidth,
//     required this.color,
//     required this.model,
//     required this.index,
//   });

//   final double aniWidth;
//   final int index;
//   final MaterialColor color;
//   final Proccess model;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         AnimatedContainer(
//           width: aniWidth,
//           duration: const Duration(milliseconds: 700),
//           height: 3,
//           color: color,
//         ),
//         CircleAvatar(
//           radius: 17,
//           backgroundColor: color,
//           child: CircleAvatar(
//             radius: 15,
//             backgroundColor: color.shade50,
//             child: Center(
//                 child: model.prefixIcon == null
//                     ? Text(
//                         "${index + 1}",
//                         style: TextStyle(
//                             color: color, fontWeight: FontWeight.bold),
//                       )
//                     : Icon(
//                         model.prefixIcon,
//                         color: color,
//                         size: 20,
//                       )),
//           ),
//         ),
//         AnimatedContainer(
//           width: aniWidth,
//           duration: const Duration(milliseconds: 700),
//           height: 3,
//           color: color,
//         ),
//       ],
//     );
//   }
// }
