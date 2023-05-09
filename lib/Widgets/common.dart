import 'package:flutter/material.dart';
import 'package:path_finder/Models/DataModel.dart';
import 'dart:js' as js;

class BorderContainers extends StatelessWidget {
  const BorderContainers({
    super.key,
    required this.data,
    required this.color,
    required this.title,
  });

  final String data;
  final MaterialColor color;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.transparent, borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: const EdgeInsets.only(left: 3.0),
        child: Container(
          decoration: BoxDecoration(
            color: color.shade50.withOpacity(0.2),
            border: Border(left: BorderSide(color: color, width: 3)),
            // borderRadius: BorderRadius.all(Radius.circular(5))
          ),
          child: Card(
              margin: EdgeInsets.zero,
              elevation: 0,
              color: color.shade200.withOpacity(0.2),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                                fontWeight: FontWeight.w900, color: color),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            data,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}

class BranchContainers extends StatefulWidget {
  const BranchContainers({
    super.key,
    required this.index,
    required this.model,
    required this.color,
    required this.isLeftBranch,
  });

  final int index;
  final Proccess model;
  final MaterialColor color;
  final bool isLeftBranch;

  @override
  State<BranchContainers> createState() => _BranchContainersState();
}

class _BranchContainersState extends State<BranchContainers> {
  double aniWidth = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 200), () {
      aniWidth = 35;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    // return Padding(
    //   padding: const EdgeInsets.symmetric(vertical: 100.0),
    //   child: Container(
    //     decoration: BoxDecoration(
    //         color: Color(widget.color.value),
    //         borderRadius: BorderRadius.circular(15)),
    //     child: Padding(
    //       padding: EdgeInsets.only(
    //           bottom: 3.0,
    //           right: widget.isLeftBranch ? 3.0 : 0,
    //           left: widget.isLeftBranch ? 0 : 3),
    //       child: Container(
    //         decoration: BoxDecoration(
    //             color: widget.color.shade50,
    //             borderRadius: const BorderRadius.all(Radius.circular(12))),
    //         child: Padding(
    //           padding: const EdgeInsets.all(16.0),
    //           child: Column(
    //             mainAxisSize: MainAxisSize.min,
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Text(
    //                 widget.model.title,
    //                 style: const TextStyle(fontWeight: FontWeight.w900),
    //               ),
    //               const SizedBox(
    //                 height: 10,
    //               ),
    //               Row(children: [
    //                 Text(
    //                   widget.model.description,
    //                   style: const TextStyle(fontWeight: FontWeight.w500),
    //                 ),
    //               ]),
    //               const SizedBox(
    //                 height: 20,
    //               ),
    //               Divider(
    //                 color: widget.color,
    //                 height: 5,
    //               ),
    //               Padding(
    //                 padding: const EdgeInsets.symmetric(vertical: 2.0),
    //                 child: Wrap(
    //                   spacing: 10,
    //                   runSpacing: 5,
    //                   children:
    //                       List.generate(widget.model.sources.length, (index) {
    //                     final source = widget.model.sources[index];
    //                     return InkWell(
    //                       onTap: () async {
    //                         if (source.type == MediaType.pdf ||
    //                             source.type == MediaType.image ||
    //                             source.type == MediaType.audio) {
    //                           js.context.callMethod("open", [source.link]);
    //                         }
    //
    //                         if (source.type == MediaType.link) {
    //                           js.context.callMethod("open", [source.link]);
    //                         }
    //                       },
    //                       child: Row(
    //                         mainAxisSize: MainAxisSize.min,
    //                         children: [
    //                           if (source.prefix != null) source.prefix!,
    //                           const SizedBox(
    //                             width: 5,
    //                           ),
    //                           Text(
    //                             source.title,
    //                             style: const TextStyle(
    //                               fontWeight: FontWeight.w500,
    //                             ),
    //                           )
    //                         ],
    //                       ),
    //                     );
    //                   }),
    //                 ),
    //               )
    //             ],
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 100.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (widget.isLeftBranch)
            BranchIconBar(
              aniWidth: aniWidth,
              color: widget.color,
              index: widget.index,
              model: widget.model,
            ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Color(widget.color.value),
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: 3.0,
                    right: widget.isLeftBranch ? 3.0 : 0,
                    left: widget.isLeftBranch ? 0 : 3),
                child: Container(
                  decoration: BoxDecoration(
                      color: widget.color.shade50,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(12))),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.model.title,
                          style: const TextStyle(fontWeight: FontWeight.w900),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(children: [
                          Text(
                            widget.model.description,
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ]),
                        const SizedBox(
                          height: 20,
                        ),
                        Divider(
                          color: widget.color,
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2.0),
                          child: Wrap(
                            spacing: 10,
                            runSpacing: 5,
                            children: List.generate(widget.model.sources.length,
                                (index) {
                              final source = widget.model.sources[index];
                              return InkWell(
                                onTap: () async {
                                  if (source.type == MediaType.pdf ||
                                      source.type == MediaType.image ||
                                      source.type == MediaType.audio) {
                                    js.context
                                        .callMethod("open", [source.link]);
                                  }

                                  if (source.type == MediaType.link) {
                                    js.context
                                        .callMethod("open", [source.link]);
                                  }
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
                  ),
                ),
              ),
            ),
          ),
          if (!widget.isLeftBranch)
            BranchIconBar(
              aniWidth: aniWidth,
              color: widget.color,
              index: widget.index,
              model: widget.model,
            ),
        ],
      ),
    );
  }
}

class BranchIconBar extends StatelessWidget {
  const BranchIconBar({
    super.key,
    required this.aniWidth,
    required this.color,
    required this.model,
    required this.index,
  });

  final double aniWidth;
  final int index;
  final MaterialColor color;
  final Proccess model;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AnimatedContainer(
          width: aniWidth,
          duration: const Duration(milliseconds: 700),
          height: 3,
          color: color,
        ),
        CircleAvatar(
          radius: 17,
          backgroundColor: color,
          child: CircleAvatar(
            radius: 15,
            backgroundColor: color.shade50,
            child: Center(
                child: model.prefixIcon == null
                    ? Text(
                        "${index + 1}",
                        style: TextStyle(
                            color: color, fontWeight: FontWeight.bold),
                      )
                    : Icon(
                        model.prefixIcon,
                        color: color,
                        size: 20,
                      )),
          ),
        ),
        AnimatedContainer(
          width: aniWidth,
          duration: const Duration(milliseconds: 700),
          height: 3,
          color: color,
        ),
      ],
    );
  }
}
