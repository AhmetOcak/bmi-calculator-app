import 'package:flutter/material.dart';
import 'package:my_bmi_calculator/core/components/textwidget/text.dart';
import 'package:my_bmi_calculator/core/constants/app_constants.dart';
import 'home/view/home_view.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  final String title = 'BMI Calculator';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: mainColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: mainColor,
        title: MyText(
          color: accentColor,
          fontSize: 35,
          text: title,
          fontWeight: FontWeight.w300,
        ),
      ),
      body: const HomeScreen(),
    );
  }
}
