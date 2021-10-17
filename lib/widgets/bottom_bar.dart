// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_bmi_calculator/constants/app_constants.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key, required this.barHeight}) : super(key: key);

  final double barHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 20,
              height: barHeight,
              decoration: BoxDecoration(
                color: accentColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
