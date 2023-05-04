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


