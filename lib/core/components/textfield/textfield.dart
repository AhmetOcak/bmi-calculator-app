import 'package:flutter/material.dart';
import 'package:my_bmi_calculator/core/constants/app_constants.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      cursorColor: accentColor,
      decoration: const InputDecoration(
        border: InputBorder.none,
        hintText: '0',
        hintStyle: TextStyle(
          color: accentColor,
          fontSize: 42,
        ),
      ),
      style: const TextStyle(
        color: accentColor,
        fontSize: 42,
      ),
    );
  }
}
