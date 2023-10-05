import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stevevionnet/features/common/application/configs/common_design.dart';
import 'package:stevevionnet/features/common/application/configs/common_font_constants.dart';
import 'package:stevevionnet/features/common/application/helpers/widget_helper.dart';

class CustomAlertDialog extends StatefulWidget {
  final String title;
  final String message;
  final Function()? okPressed;
  final Function()? closePressed;
  final String? okText;
  final String? closeText;
  final List<Widget> customWidgets;

  const CustomAlertDialog({super.key, required this.title, required this.message, this.okPressed, this.closePressed, this.okText = "Got it", this.closeText = "Cancel", this.customWidgets = const []});

  @override
  State<CustomAlertDialog> createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog> {
  bool _clicked = false;

  @override
  Widget build(BuildContext context) {

    const Size dialogSize = Size(250, 250);

    Widget cancelButton = InkWell(
      onTap: () {
        HapticFeedback.heavyImpact();
        if (!_clicked) {
          setState(() {
            _clicked = true;
          });
          if (widget.closePressed != null) {
            widget.closePressed!();
          } else {
            Navigator.of(context).pop();
          }
        }
      },
      child: Container(
        width: dialogSize.width * 0.46,
        height: 42,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0x42556789)),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Center(
          child: Text(
            widget.closeText ?? "Cancel",
            style: const TextStyle(
                color: Colors.white,
                fontSize: 13
            ),
          ),
        ),
      )
    );

    Widget okButton = InkWell(
      onTap: () {
        HapticFeedback.heavyImpact();
        if (!_clicked) {
          setState(() {
            _clicked = true;
          });
          if (widget.okPressed != null) {
            widget.okPressed!();
            Navigator.of(context).pop();
          } else {
            Navigator.of(context).pop();
          }
        }
      },
      child: Container(
        width: dialogSize.width * 0.46,
        height: 42,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Center(
          child: Text(
            widget.okText ?? "Got It",
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: CommonFontConstants.spaceGrotesk,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );

    Column alertContent = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
              widget.title,
              style: WidgetHelper.getTextStyle(CommonDesign.popupAlertTitleText)
          ),
        ),
        widget.message.isNotEmpty ? Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              widget.message,
              style: WidgetHelper.getTextStyle(CommonDesign.popupAlertContentText),
              textAlign: TextAlign.left,
            )
        ) : const SizedBox(),
        ...widget.customWidgets,
        Padding(
          padding: const EdgeInsets.only(top: 25.0, bottom: 15),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                cancelButton,
                const SizedBox(width: 10,),
                okButton
              ],
            ),
          ),
        )
      ],
    );


    /*return Theme.of(context).platform == TargetPlatform.iOS ? CupertinoAlertDialog(content: alertContent, actions: <Widget>[okButton]) :
    AlertDialog(backgroundColor: const Color.fromRGBO(34, 38, 45, 1), content: alertContent, actions: [okButton]);*/
    return Dialog(
        alignment: Alignment.center,
        shape: RoundedRectangleBorder (
            borderRadius: BorderRadius.circular(14)
        ), //
        backgroundColor: const Color.fromRGBO(15, 15, 15, 1),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
                width: dialogSize.width,
               // padding: EdgeInsets.symmetric(horizontal: dialogSize.width * 0.1, vertical: dialogSize.height * 0.01),
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),

                ),
                child: SizedBox(
                  width: dialogSize.width * 0.9,
                  child: alertContent,
                )
            ),
          ],
        )/*,
       actions: [okButton, cancelButton]*/
    );
  }
}
