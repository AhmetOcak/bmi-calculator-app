import 'package:flutter/material.dart';
import 'constants/app_constants.dart';
import 'screen/home_screen.dart';

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

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: mainColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: mainColor,
        title: const Text(
          'BMI Calculator',
          style: TextStyle(
              color: accentColor, fontSize: 35, fontWeight: FontWeight.w300),
        ),
      ),
      body: const HomeScreen(),
    );
  }
}
