import 'package:flutter/material.dart';
import 'dart:js' as js;

import 'Models/DataModel.dart';

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
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
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
