import 'package:flutter/material.dart';
import 'package:stevevionnet/features/common/application/configs/common_font_constants.dart';

class WidgetHelper {
  static TextStyle getTextStyle(Map<String, dynamic> params){
    final String fontFamily = params["fontFamily"] != null ? params["fontFamily"] as String : CommonFontConstants.defaultFont;
    double? fontSize;
    if (params["fontSize"] != null){
      if (params["fontSize"] is double){
        fontSize = params["fontSize"] as double;
      }
      else if (params["fontSize"] is int) {
        fontSize = (params["fontSize"] as int).toDouble();
      }
    }

    double? height;
    double? lineHeight;

    if (params["lineHeight"] is int) {
      lineHeight = (params["lineHeight"] as int).toDouble();
    }
    else if (params["lineHeight"] is double){
      lineHeight = params["lineHeight"];
    }

    if (lineHeight != null && fontSize != null){
      height = lineHeight / fontSize;
    }

    return TextStyle(
        decoration: params["decoration"] as TextDecoration?,
        fontFamily: fontFamily,
        fontWeight: params["fontWeight"] as FontWeight?,
        fontSize: fontSize,
        color: params["color"] as Color?,
        height: height,
        fontStyle: params["fontStyle"] as FontStyle?,
        letterSpacing: params["letterSpacing"] is int ? (params["letterSpacing"] as int).toDouble() : params["letterSpacing"] as double?
    );
  }

}