import 'package:flutter/material.dart';

class NewCustomeColorPlatte {
  List<MaterialColor> colorsListNew = [
    // Colors.amber,
    // Colors.blue,
    // Colors.blueGrey,
    // Colors.brown,
    // Colors.cyan,
    Colors.deepOrange,
    // Colors.deepPurple,
    // Colors.green,
    // Colors.grey,
    // Colors.indigo,
    Colors.lightBlue,
    // Colors.lightGreen,
    // Colors.lime,
    // Colors.orange,
    Colors.pink,
    // Colors.purple,
    // Colors.red,
    Colors.teal,
    // Colors.yellow,
  ];

  MaterialColor getRowColor({required int index}) {
    if (index >= colorsListNew.length) {
      index = index % (colorsListNew.length);
    }
    return colorsListNew[index];
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
