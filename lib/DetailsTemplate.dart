import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:path_finder/DataModel.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:html' as html;
import 'Timeline/style.dart';
import 'Timeline/tile.dart';
import 'colors.dart';
import 'dart:js' as js;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class DetailsTemplate extends StatefulWidget {
  const DetailsTemplate({super.key, required this.model});
  final DropDownCarrerModel model;
  @override
  State<DetailsTemplate> createState() => _DetailsTemplateState();
}

class _DetailsTemplateState extends State<DetailsTemplate> {
  List tabBarLebel = ["Meaning", "Scope", "Function", "Package", "Qualites"];
  List tabBarLebelColor = [
    Colors.red,
    Colors.indigo,
    Colors.green,
    Colors.orange,
    Colors.blue
  ];
  int selectedTabIndex = 0;
  Color headingColor = Color(0xff001F51);

  @override
  Widget build(BuildContext context) {
    List<Widget> myWidgets = [
      Row(
        children: [
          Text(
            widget.model.model.title,
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
          data: widget.model.model.meaning,
          color: Colors.blueGrey,
        ),
        BorderContainers(
          title: "Scope",
          data: widget.model.model.scope,
       color: Colors.blueGrey,
        ),
        BorderContainers(
          title: "Function",
          data: widget.model.model.function,
          color: Colors.blueGrey,
        ),
        BorderContainers(
          title: "Package",
          data: widget.model.model.package,
          color: Colors.blueGrey,
        ),
        BorderContainers(
          title: "Qualites",
          data: widget.model.model.qualites,
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
      Column(
        children: List.generate(widget.model.model.proccess.length, (index) {
          final isLeft = index % 2 != 0;
          final isLastIndex = index == widget.model.model.proccess.length - 1;
          final color = NewCustomeColorPlatte().getRowColor(index: index);
          final lightColor =
              NewCustomeColorPlatte().getColorWithShade50(index: index);
          final process = widget.model.model.proccess[index];
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
                  ),
            startChild: isLeft
                ? BranchContainers(
                    model: process,
                    color: color,
                    isLeftBranch: isLeft,
                  )
                : null,
          );
        }),
      )
    ];

    return DefaultTabController(
      length: 5,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(16.0),

          // child: AnimationLimiter(
          //   child: ListView.builder(
          //     itemCount: myWidgets.length,
          //     itemBuilder: (BuildContext context, int index) {
          //       return AnimationConfiguration.staggeredList(
          //         position: index,
          //         duration: const Duration(milliseconds: 500),
          //         child: SlideAnimation(
          //           verticalOffset: 50.0,
          //           child: FadeInAnimation(
          //             child: myWidgets[index],
          //           ),
          //         ),
          //       );
          //     },
          //   ),
          // )

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
      prefix: Icon(CupertinoIcons.globe),
      title: "About Flutter",
      link:
          "https://www.google.com/search?q=flutter+sdk&oq=flutter+sdk&aqs=chrome..69i57j0i433i512j0i512l8.8032j0j7&sourceid=chrome&ie=UTF-8",
      type: MediaType.link),
  SourceModel(
      title: "Introduction",
      prefix: Icon(
        CupertinoIcons.videocam_circle,
        color: Colors.blue,
      ),
      link: "https://www.youtube.com/watch?v=XeG1sEQitLk",
      type: MediaType.video),
  SourceModel(
      title: "Document",
      prefix: Icon(
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
                            style: TextStyle(
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
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              model.title,
                              style: TextStyle(fontWeight: FontWeight.w900),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              model.description,
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
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
                                      if (source.type == MediaType.pdf ||
                                          source.type == MediaType.image ||
                                          source.type == MediaType.audio) {
                                        html.AnchorElement anchorElement =
                                            new html.AnchorElement(
                                                href: source.link);
                                        anchorElement.download = source.link;
                                        anchorElement.click();
                                      }

                                      if (source.type == MediaType.link) {
                                        js.context
                                            .callMethod("open", [source.link]);
                                      }
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        if (source.prefix != null)
                                          source.prefix!,
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          source.title,
                                          style: TextStyle(
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
