import 'package:flutter/material.dart';

class NewCustomColorPlatte {
  List<MaterialColor> colorsListNew = [
    Colors.deepOrange,
    Colors.lightBlue,
    Colors.pink,
    Colors.teal,
  ];

  Color blueColor = const Color(0xff009BDF);
  Color headingColor = const Color(0xff001F51);
  Color pink = Colors.pink;
  Color textColor = const Color(0xff5D5D5D);

  MaterialColor getRowColor({required int index}) {
    if (index >= colorsListNew.length) {
      index = index % (colorsListNew.length);
    }
    return colorsListNew[index];
  }

  getHeadingColor() {
    return const Color.fromARGB(255, 3, 2, 14);
  }

  getColorWithShade50({required int index}) {
    if (index >= colorsListNew.length) {
      index = index % (colorsListNew.length);
    }
    return colorsListNew[index].shade50;
  }

  getColorWithShade100({required int index}) {
    if (index >= colorsListNew.length) {
      index = index % (colorsListNew.length);
    }
    return colorsListNew[index].shade100;
  }

  getColorWithShade200({required int index}) {
    if (index >= colorsListNew.length) {
      index = index % (colorsListNew.length);
    }
    return colorsListNew[index].shade200;
  }

  getColorWithShade300({required int index}) {
    if (index >= colorsListNew.length) {
      index = index % (colorsListNew.length);
    }
    return colorsListNew[index].shade300;
  }

  getColorWithShade400({required int index}) {
    if (index >= colorsListNew.length) {
      index = index % (colorsListNew.length);
    }
    return colorsListNew[index].shade400;
  }

  getColorWithShade500({required int index}) {
    if (index >= colorsListNew.length) {
      index = index % (colorsListNew.length);
    }
    return colorsListNew[index].shade500;
  }

  getColorWithShade600({required int index}) {
    if (index >= colorsListNew.length) {
      index = index % (colorsListNew.length);
    }
    return colorsListNew[index].shade600;
  }

  getColorWithShade700({required int index}) {
    if (index >= colorsListNew.length) {
      index = index % (colorsListNew.length);
    }
    return colorsListNew[index].shade700;
  }

  getColorWithShade800({required int index}) {
    if (index >= colorsListNew.length) {
      index = index % (colorsListNew.length);
    }
    return colorsListNew[index].shade800;
  }

  getColorWithShade900({required int index}) {
    if (index >= colorsListNew.length) {
      index = index % (colorsListNew.length);
    }
    return colorsListNew[index].shade900;
  }
}
