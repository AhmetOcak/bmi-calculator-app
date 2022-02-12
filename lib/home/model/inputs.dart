import 'package:flutter/material.dart';
import 'package:my_bmi_calculator/core/components/button/calculate_button.dart';
import 'package:my_bmi_calculator/core/components/textfield/textfield.dart';
import 'package:my_bmi_calculator/core/components/textwidget/text.dart';
import 'package:my_bmi_calculator/core/constants/app_constants.dart';
import 'package:my_bmi_calculator/home/viewmodel/home_view_model.dart';

class DataInput extends StatefulWidget {
  const DataInput({Key? key}) : super(key: key);

  @override
  _DataInputState createState() => _DataInputState();
}

class _DataInputState extends State<DataInput> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0.0;
  static const String heigthText = "Your Height in cm";
  static const String weigthText = "Your Weight in kg";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const MyText(
          text: heigthText,
          fontSize: 25,
          color: accentColor,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        // HEIGHT INPUT
        MyTextField(controller: _heightController),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        const MyText(
          text: weigthText,
          fontSize: 25,
          color: accentColor,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        // WEIGHT INPUT
        MyTextField(
          controller: _weightController,
        ),
        CalculateButton(
            heightController: _heightController,
            weightController: _weightController,
            callback: () {
              setState(() {
                _bmiResult = HomeViewModel().result(
                    _heightController.text, _weightController.text, context)!;
              });
            }),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        MyText(
          text: 'Your BMI : ${_bmiResult.toStringAsFixed(2)}',
          fontSize: 42,
          color: accentColor,
          fontWeight: FontWeight.w300,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: const Divider(
            color: accentColor,
            height: 1,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        MyText(
          text: HomeViewModel().controlResult(_bmiResult),
          fontSize: 42,
          color: accentColor,
          textAlign: TextAlign.center,
          fontWeight: FontWeight.w300,
        ),
      ],
    );
  }
}
