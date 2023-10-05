import 'package:flutter/material.dart';

class CommonColorConstants {
  static const Color appBarTextColor = Colors.white;
  static const Color mainBackgroundColor = Colors.black;
  static const Color doneColor = Color.fromRGBO(0, 255, 12, 1.0);
  static const Color unfinishedColor = Color.fromRGBO(255, 0, 0, 1);

  static const MaterialColor primaryBlack = MaterialColor(
    _blackPrimaryValue,
    <int, Color>{
      50: Color(0xFF000000),
      100: Color(0xFF000000),
      200: Color(0xFF000000),
      300: Color(0xFF000000),
      400: Color(0xFF000000),
      500: Color(_blackPrimaryValue),
      600: Color(0xFF000000),
      700: Color(0xFF000000),
      800: Color(0xFF000000),
      900: Color(0xFF000000),
    },
  );
  static const int _blackPrimaryValue = 0xFF000000;

  static Color fromPercentDone(double percentDone) {
    if (percentDone < 25) {
      return CommonColorConstants.unfinishedColor;
    }
    else if (percentDone < 50) {
      return Colors.yellow;
    }
    else if (percentDone < 75) {
      return Colors.orange;
    }
    else {
      return CommonColorConstants.doneColor;
    }
  }

}