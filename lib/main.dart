import 'package:flutter/material.dart';
import 'constants/app_constants.dart';
import 'screen/home_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
  // HIDE STATUS BAR
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: mainColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: mainColor,
        title: Text(
          'BMI Calculator',
          style: TextStyle(
              color: accentColor, fontSize: 35, fontWeight: FontWeight.w300),
        ),
      ),
      body: HomeScreen(),
    );
  }
}
