import 'dart:math';

import 'package:flutter/material.dart';
import 'package:stevevionnet/features/common/application/configs/common_font_constants.dart';

class CommonDesign {
  static Map<String, Object> popupAlertContentText = {
    "color": Colors.white.withOpacity(0.5),
    "fontSize": 14,
    "fontWeight": FontWeight.w400,
    "fontFamily": CommonFontConstants.spaceGrotesk,
  };

  static const popupAlertDeleteButtonText = {
    "color": Colors.red
  };

  static const popupAlertTitleText = {
    "color": Colors.white,
    "fontSize": 19,
    "fontWeight": FontWeight.w700
  };

  static Color randomColor() {
    Random random = Random();
    int redRandom = random.nextInt(256);
    int greenRandom = random.nextInt(256);
    int blueRandom = random.nextInt(256);

    return Color.fromRGBO(redRandom, greenRandom, blueRandom, 1);
  }
}