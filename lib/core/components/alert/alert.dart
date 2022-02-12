import 'package:flutter/cupertino.dart';
import 'package:my_bmi_calculator/core/components/textwidget/text.dart';
import 'package:my_bmi_calculator/core/constants/app_constants.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class MyAlert {
  final String warning = "Warning";
  final String ok = "Ok";

  Future<bool?> getAlert(String text, BuildContext context) {
    return Alert(
      context: context,
      title: warning,
      desc: text,
      buttons: [
        DialogButton(
          color: accentColor,
          child: MyText(
            text: ok,
            color: mainColor,
            fontSize: 25,
            fontWeight: FontWeight.w400,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
      style: const AlertStyle(
        alertBorder: RoundedRectangleBorder(
          side: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        backgroundColor: mainColor,
        titleStyle: TextStyle(
          color: accentColor,
          fontSize: 30,
          fontWeight: FontWeight.w500,
        ),
        descStyle: TextStyle(
          color: accentColor,
          fontSize: 25,
          fontWeight: FontWeight.w300,
        ),
      ),
    ).show();
  }
}
