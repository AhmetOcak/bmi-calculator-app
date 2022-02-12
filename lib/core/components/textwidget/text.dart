import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  const MyText({
    Key? key, required this.text, required this.fontSize, required this.color, this.textAlign, this.fontWeight,
  }) : super(key: key);

  final String text;
  final double fontSize;
  final Color color;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
      textAlign: textAlign,
    );
  }
}