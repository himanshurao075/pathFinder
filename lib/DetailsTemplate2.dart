import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:path_finder/DataModel.dart';
import 'package:path_finder/main.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:html' as html;
import 'Timeline/style.dart';
import 'Timeline/tile.dart';
import 'colors.dart';
import 'dart:js' as js;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class DetailsTemplate2 extends StatefulWidget {
const   DetailsTemplate2({
    super.key,
    required this.model
  });
  // final DropDownCarrerModel model =
  //     DropDownCarrerModel(label: "MBA", model: mbaModel);
  final DropDownCarrerModel model;
  @override
  State<DetailsTemplate2> createState() => _DetailsTemplate2State();
}

class _DetailsTemplate2State extends State<DetailsTemplate2> {
  List tabBarLebel = ["Meaning", "Scope", "Function", "Package", "Qualites"];
  List tabBarLebelColor = [
    Colors.red,
    Colors.indigo,
    Colors.green,
    Colors.orange,
    Colors.blue
  ];
  int selectedTabIndex = 0;
  Color headingColor = const Color(0xff001F51);
  double radius = 10;
  @override
  void initState() {
    super.initState();

    myModel = DropDownCarrerModel(
        label: widget.model.label,
        model: CarrerModel(
          title: widget.model.model.title,
          function: widget.model.model.function,
          scope: widget.model.model.scope,
          meaning: widget.model.model.meaning,
          package: widget.model.model.package,
          qualites: widget.model.model.qualites,
          proccess: [widget.model.model.proccess.first],
        ));
  }

  nextStep() {
    List<Process> temp = [];
    for (int i = 0; i < totalProcess; i++) {
      temp.add(widget.model.model.proccess[i]);
    }
    myModel.model.proccess = temp;
    totalProcess += 1;
    setState(() {});
  }

  late DropDownCarrerModel myModel;
  int totalProcess = 1;

  @override
  Widget build(BuildContext context) {
    List<Widget> myWidgets = [
      Row(
        children: [
          Text(
            myModel.model.title,
            style: TextStyle(fontWeight: FontWeight.w700, color: headingColor),
            textScaleFactor: 2,
          )
        ],
      ),

      const SizedBox(
        height: 20,
      ),

      TabBar(
          indicatorColor: NewCustomeColorPlatte().blueColor,
          indicatorWeight: 3.0,
          onTap: (value) {
            selectedTabIndex = value;
            setState(() {});
          },
          tabs: tabBarLebel
              .mapIndexed((index, e) => Tab(
                    child: Text(
                      e,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: NewCustomeColorPlatte().pink,
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
          data: myModel.model.meaning,
          color: Colors.blueGrey,
        ),
        BorderContainers(
          title: "Scope",
          data: myModel.model.scope,
          color: Colors.blueGrey,
        ),
        BorderContainers(
          title: "Function",
          data: myModel.model.function,
          color: Colors.blueGrey,
        ),
        BorderContainers(
          title: "Package",
          data: myModel.model.package,
          color: Colors.blueGrey,
        ),
        BorderContainers(
          title: "Qualites",
          data: myModel.model.qualites,
          color: Colors.blueGrey,
        ),
      ][selectedTabIndex],
      const SizedBox(
        height: 20,
      ),
      // Row(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: const [
      //     Text(
      //       "Here the Journey Begins",
      //       style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
      //       textScaleFactor: 1.5,
      //     )
      //   ],
      // ),
      // const SizedBox(
      //   height: 20,
      // ),

      Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: Column(
            children: [
              AnimationLimiter(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: myModel.model.proccess.length,
                  itemBuilder: (BuildContext context, int index) {
                    final isLeft = (index + 1) % 2 != 0;
                    final isLastIndex =
                        index == myModel.model.proccess.length - 1;
                    final color =
                        NewCustomeColorPlatte().getRowColor(index: index);
                    final lightColor = NewCustomeColorPlatte()
                        .getColorWithShade50(index: index);
                    final process = myModel.model.proccess[index];
                    final isStart = index == 0;
                    // double radius = 10;

                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 700),
                      child: FadeInAnimation(
                        duration: const Duration(milliseconds: 1400),
                        child: Column(
                          children: [
                            Container(
                              // height: MediaQuery.of(context).size.height * 0.25,
                              decoration: BoxDecoration(
                                  color: Colors.brown.shade200,
                                  borderRadius: BorderRadius.vertical(
                                      top: isStart
                                          ? Radius.circular(radius)
                                          : Radius.zero)),
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
                                      topLeft: isLeft
                                          ? Radius.zero
                                          : Radius.circular(radius),
                                      bottomLeft: isLastIndex
                                          ? Radius.circular(radius)
                                          : isLeft
                                              ? Radius.circular(radius)
                                              : Radius.zero,
                                      topRight: !isLeft
                                          ? Radius.zero
                                          : Radius.circular(radius),
                                      bottomRight: !isLeft
                                          ? Radius.circular(radius)
                                          : Radius.zero)),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              if (myModel.model.proccess.length !=
                  widget.model.model.proccess.length) ...[
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: myModel.model.proccess.length % 2 == 0
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red),
                        onPressed: nextStep,
                        child: const Text("Next  >>")),
                  ],
                )
              ]
            ],
          ),
        ),
      ),
    ];

    return DefaultTabController(
      length: 5,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(children: myWidgets),
          ),
        ),
      ),
    );
  }
}

List<SourceModel> sources = [
  SourceModel(
      prefix: const Icon(CupertinoIcons.globe),
      title: "About Flutter",
      link:
          "https://www.google.com/search?q=flutter+sdk&oq=flutter+sdk&aqs=chrome..69i57j0i433i512j0i512l8.8032j0j7&sourceid=chrome&ie=UTF-8",
      type: MediaType.link),
  SourceModel(
      title: "Introduction",
      prefix: const Icon(
        CupertinoIcons.videocam_circle,
        color: Colors.blue,
      ),
      link: "https://www.youtube.com/watch?v=XeG1sEQitLk",
      type: MediaType.video),
  SourceModel(
      title: "Document",
      prefix: const Icon(
        Icons.picture_as_pdf_rounded,
        color: Colors.red,
      ),
      link: "https://www.africau.edu/images/default/sample.pdf",
      type: MediaType.pdf),
  SourceModel(
      prefix: const Icon(
        Icons.image,
        color: Colors.blue,
      ),
      title: "Hotel Image",
      link:
          "https://www.homelane.com/blog/wp-content/uploads/2022/11/bungalow-interiors.jpg",
      type: MediaType.image),
];

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
  final Process model;
  final MaterialColor color;
  final bool isLeftBranch;

  @override
  State<BranchContainers> createState() => _BranchContainersState();
}

class _BranchContainersState extends State<BranchContainers> {
  double aniWidth = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 700), () {
      aniWidth = 35;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0),
      child: Row(
        children: [
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (widget.isLeftBranch)
                  BranchIconBar(
                    aniWidth: aniWidth,
                    color: widget.color,
                    index: widget.index,
                    model: widget.model,
                  ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: widget.isLeftBranch
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
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
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(12))),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.model.title,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w900),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(children: [
                                      Text(
                                        widget.model.description,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ]),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    // Divider(
                                    //   color: widget.color,
                                    //   height: 5,
                                    // ),
                                    // Padding(
                                    //   padding: const EdgeInsets.symmetric(
                                    //       vertical: 2.0),
                                    //   child: Wrap(
                                    //     spacing: 10,
                                    //     runSpacing: 5,
                                    //     children: List.generate(
                                    //         widget.model.sources.length,
                                    //         (index) {
                                    //       final source =
                                    //           widget.model.sources[index];
                                    //       return InkWell(
                                    //         onTap: () async {
                                    //           if (source.type ==
                                    //                   MediaType.pdf ||
                                    //               source.type ==
                                    //                   MediaType.image ||
                                    //               source.type ==
                                    //                   MediaType.audio) {
                                    //             html.AnchorElement
                                    //                 anchorElement =
                                    //                 new html.AnchorElement(
                                    //                     href: source.link);
                                    //             anchorElement.download =
                                    //                 source.link;
                                    //             anchorElement.click();
                                    //           }

                                    //           if (source.type ==
                                    //               MediaType.link) {
                                    //             js.context.callMethod(
                                    //                 "open", [source.link]);
                                    //           }
                                    //         },
                                    //         child: Row(
                                    //           mainAxisSize: MainAxisSize.min,
                                    //           children: [
                                    //             if (source.prefix != null)
                                    //               source.prefix!,
                                    //             const SizedBox(
                                    //               width: 5,
                                    //             ),
                                    //             Text(
                                    //               source.title,
                                    //               style: const TextStyle(
                                    //                 fontWeight: FontWeight.w500,
                                    //               ),
                                    //             )
                                    //           ],
                                    //         ),
                                    //       );
                                    //     }),
                                    //   ),
                                    // )
                                  ],
                                ),
                              )),
                        ),
                      ),
                    ],
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
          ),
          // if (widget.isLeftBranch)
          //   Expanded(
          //     child: SizedBox(),
          //   ),
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
  final Process model;
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
