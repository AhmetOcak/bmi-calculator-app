import 'package:flutter/material.dart';
import 'package:my_bmi_calculator/core/components/textwidget/text.dart';
import 'package:my_bmi_calculator/core/constants/app_constants.dart';
import 'package:my_bmi_calculator/home/viewmodel/home_view_model.dart';

class CalculateButton extends StatefulWidget {
  const CalculateButton({
    Key? key,
    required this.heightController,
    required this.weightController,
    required this.callback,
  }) : super(key: key);

  final TextEditingController heightController;
  final TextEditingController weightController;
  final VoidCallback callback;
  final String buttonText = "Calculate";

  @override
  _CalculateButtonState createState() => _CalculateButtonState();
}

class _CalculateButtonState extends State<CalculateButton> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(75),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.height * 0.1,
        color: accentColor,
        child: TextButton(
          onPressed: () {
            setState(() {
              FocusScope.of(context).unfocus();
              bool isItChecked = HomeViewModel().nullTextControl(
                widget.heightController.text.isEmpty,
                widget.weightController.text.isEmpty,
                context,
              );
              if (isItChecked == false) {
                widget.callback();
              }
            });
          },
          child: MyText(
            text: widget.buttonText,
            color: mainColor,
            fontSize: 25.0,
          ),
        ),
      ),
    );
  }
}
