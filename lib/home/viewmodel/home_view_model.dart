import 'package:flutter/material.dart';
import 'package:my_bmi_calculator/core/components/alert/alert.dart';

class HomeViewModel {

  bool nullTextControl(
      bool isHeightEmpty, bool isWeightEmpty, BuildContext context) {
    if (isHeightEmpty) {
      MyAlert().getAlert('Please enter your height.', context);
      return true;
    } else if (isWeightEmpty) {
      MyAlert().getAlert('Please enter your weight.', context);
      return true;
    } else {
      return false;
    }
  }

  double? result(String height, String weight, BuildContext context) {
    if (height == '0') {
      MyAlert().getAlert('Height can\'t be 0.', context);
      return null;
    } else if (weight == '0') {
      MyAlert().getAlert('Weight can\'t be 0.', context);
      return null;
    } else {
      return (double.parse(weight) / 10000) /
          ((double.parse(height) / 10000) * (double.parse(height) / 10000));
    }
  }

  String controlResult(double bmiResult) {
    if (bmiResult < 18.5) {
        return 'You\'re under weight';
      } else if (bmiResult >= 18.5 && bmiResult < 24.9) {
        return 'You have normal weight';
      } else if (bmiResult >= 24.9 && bmiResult < 30.0) {
        return 'You are overweight.';
      } else if (bmiResult >= 30.0 && bmiResult < 35.0) {
        return 'Type 1 obese';
      } else if (bmiResult >= 35.0 && bmiResult < 40.0) {
        return 'Type 2 obese';
      } else {
        return 'Morbid obese';
      }
  }
}
