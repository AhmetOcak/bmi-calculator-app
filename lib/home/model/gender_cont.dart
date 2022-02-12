import 'package:flutter/material.dart';

class GenderContanier extends StatelessWidget {
  const GenderContanier({
    Key? key,
    required this.gender,
    required this.contColor,
  }) : super(key: key);

  final String gender;
  final Color contColor;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(20),
      ),
      child: Center(
        child: Container(
          child: Image.asset(
            'assets/images/$gender.png',
          ),
          width: MediaQuery.of(context).size.width * 0.4,
          height: MediaQuery.of(context).size.height * 0.12,
          color: contColor,
        ),
      ),
    );
  }
}
