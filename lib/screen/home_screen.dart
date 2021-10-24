import 'package:flutter/material.dart';
import 'package:my_bmi_calculator/constants/app_constants.dart';
import 'package:my_bmi_calculator/man_woman_buttons/gender_cont.dart';
import 'package:my_bmi_calculator/widgets/bottom_bar.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // if _isActive == true ---> gender = male
  // if _isActive == false ---> gender = female
  bool _isItActive = true;
  String _bmiTextResult = '';
  late double _bmiResult = 0.0;

  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  double _height = 0.0;
  double _weight = 0.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          // GENDER SELECTION
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    _isItActive = true;
                  });
                },
                child: GenderContanier(
                    gender: 'male',
                    contColor:
                        (_isItActive == true ? Colors.blue : Colors.white)),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _isItActive = false;
                  });
                },
                child: GenderContanier(
                    gender: 'female',
                    contColor:
                        (_isItActive == false ? Colors.blue : Colors.white)),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 19,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Your Height in cm',
                style: TextStyle(
                  color: accentColor,
                  fontSize: 25,
                  fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 90,
              ),
              // HEIGHT INPUT
              TextField(
                controller: _heightController,
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
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 90,
              ),
              const Text(
                'Your Weight in kg',
                style: TextStyle(
                    color: accentColor,
                    fontSize: 25,
                    fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 90,
              ),
              // WEIGHT INPUT
              TextField(
                controller: _weightController,
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
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              // CALCULATE BUTTON
              ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(75),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.height / 6.5,
                  height: MediaQuery.of(context).size.height / 6.5,
                  color: accentColor,
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        FocusScope.of(context).unfocus();
                        bool isItChecked = nullTextControl();
                        if (isItChecked == false) {
                          results();
                        }
                      });
                    },
                    child: const Text(
                      'Calculate',
                      style: TextStyle(color: mainColor, fontSize: 20.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              // BMI RESULT SECTION
              Text(
                'Your BMI : ${_bmiResult.toStringAsFixed(2)}',
                style: const TextStyle(
                    color: accentColor,
                    fontSize: 42,
                    fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 100,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.height / 4.5,
                child: const Divider(
                  color: accentColor,
                  height: 1,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 100,
              ),
              Text(
                _bmiTextResult,
                style: const TextStyle(
                    color: accentColor,
                    fontSize: 42,
                    fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 70,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.height,
                height: MediaQuery.of(context).size.height / 9,
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BottomBar(
                        barHeight: MediaQuery.of(context).size.height / 9,
                      ),
                      BottomBar(
                        barHeight: MediaQuery.of(context).size.height / 11,
                      ),
                      BottomBar(
                        barHeight: MediaQuery.of(context).size.height / 15,
                      ),
                      BottomBar(
                        barHeight: MediaQuery.of(context).size.height / 20,
                      ),
                      BottomBar(
                        barHeight: MediaQuery.of(context).size.height / 35,
                      ),
                      BottomBar(
                        barHeight: MediaQuery.of(context).size.height / 35,
                      ),
                      BottomBar(
                        barHeight: MediaQuery.of(context).size.height / 20,
                      ),
                      BottomBar(
                        barHeight: MediaQuery.of(context).size.height / 15,
                      ),
                      BottomBar(
                        barHeight: MediaQuery.of(context).size.height / 11,
                      ),
                      BottomBar(
                        barHeight: MediaQuery.of(context).size.height / 9,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void myAlert(String str) {
    Alert(
      context: context,
      title: 'Warning',
      desc: str,
      buttons: [
        DialogButton(
          color: accentColor,
          child: const Text(
            'OK',
            style: TextStyle(
                color: mainColor, fontSize: 25, fontWeight: FontWeight.w400),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
      style: const AlertStyle(
        alertBorder: RoundedRectangleBorder(
          side: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        backgroundColor: mainColor,
        titleStyle: TextStyle(
          color: accentColor,
          fontSize: 30,
          fontWeight: FontWeight.w500,
        ),
        descStyle: TextStyle(
          color: accentColor,
          fontSize: 25,
          fontWeight: FontWeight.w300,
        ),
      ),
    ).show();
  }

  bool nullTextControl() {
    if (_heightController.text.isEmpty) {
      myAlert('Please enter your height.');
      return true;
    } else if (_weightController.text.isEmpty) {
      myAlert('Please enter your weight.');
      return true;
    } else {
      _height = double.parse(_heightController.text) / 10000;
      _weight = double.parse(_weightController.text) / 10000;
      return false;
    }
  }

  void results() {
    if (_height == 0) {
      myAlert('Height can\'t be 0.');
    } else if (_weight == 0) {
      myAlert('Weight can\'t be 0.');
    } else {
      _bmiResult = _weight / (_height * _height);
      if (_bmiResult < 18.5) {
        _bmiTextResult = 'You\'re under weight';
      } else if (_bmiResult >= 18.5 && _bmiResult < 24.9) {
        _bmiTextResult = 'You have normal weight';
      } else if (_bmiResult >= 24.9 && _bmiResult < 30.0) {
        _bmiTextResult = 'You are overweight.';
      } else if (_bmiResult >= 30.0 && _bmiResult < 35.0) {
        _bmiTextResult = 'Type 1 obese';
      } else if (_bmiResult >= 35.0 && _bmiResult < 40.0) {
        _bmiTextResult = 'Type 2 obese';
      } else {
        _bmiTextResult = 'Morbid obese';
      }
    }
  }
}
