// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class GenderContanier extends StatelessWidget {
  GenderContanier({Key? key, required this.gender, required this.contColor}) : super(key: key);

  final String gender;
  final Color contColor;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(
        Radius.circular(20),
      ),
      child: Center(
        child: Container(
          child: Image.asset(
            'assets/images/$gender.png',
          ),
          width: 170,
          height: 100,
          color: contColor,
        ),
      ),
    );
  }
}

