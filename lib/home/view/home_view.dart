import 'package:flutter/material.dart';
import 'package:my_bmi_calculator/home/model/gender_cont.dart';
import 'package:my_bmi_calculator/home/model/inputs.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // if _isActive == true ---> gender = male
  // if _isActive == false ---> gender = female
  bool _isItActive = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          gender(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const DataInput(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Row gender() {
    const String male = "male";
    const String female = "female";
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextButton(
          onPressed: () {
            setState(() {
              _isItActive = true;
            });
          },
          child: GenderContanier(
            gender: male,
            contColor: (_isItActive == true ? Colors.blue : Colors.white),
          ),
        ),
        TextButton(
          onPressed: () {
            setState(() {
              _isItActive = false;
            });
          },
          child: GenderContanier(
            gender: female,
            contColor: (_isItActive == false ? Colors.blue : Colors.white),
          ),
        ),
      ],
    );
  }
}
