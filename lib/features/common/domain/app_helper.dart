import 'package:flutter/material.dart';
import 'package:stevevionnet/features/common/presentation/widgets/custom_alert_dialog.dart';

class AppHelper {
  Future<dynamic> showAlert({required BuildContext context, required String title, required String message, String? okText, Function()? okPressed, List<Widget> customWidgets = const [], String closeText = "Close'"}) async {
    return await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return CustomAlertDialog(
          title: title,
          message: message,
          okText: okText,
          okPressed: okPressed,
          closeText: closeText,
          customWidgets: customWidgets,
        );
      },
    );
  }
}