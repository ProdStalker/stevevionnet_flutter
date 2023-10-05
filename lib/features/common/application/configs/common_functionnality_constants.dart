import 'dart:io';

import 'package:path_provider/path_provider.dart';

class CommonFunctionnalityConstant {
  static Future<String> pathForHiveDB() async {
    Directory directory = await getApplicationDocumentsDirectory();

    return "${directory.path}/db/";
  }

  static bool isDebugMode() {
    bool inDebug = false;
    assert(() {
      inDebug = true;
      return true;
    }());

    return inDebug;
  }


}