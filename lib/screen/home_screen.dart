// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_field, prefer_final_fields, sized_box_for_whitespace
import 'package:flutter/material.dart';
import 'package:my_bmi_calculator/constants/app_constants.dart';
import 'package:my_bmi_calculator/man_woman_buttons/gender_cont.dart';
import 'package:my_bmi_calculator/widgets/bottom_bar.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // if _isActive == true ---> gender = male
  // if _isActive == false ---> gender = female
  bool _isItActive = true;
  String _bmiTextResult = '';
  late double _bmiResult = 0.0;

  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();

  double _height = 0.0;
  double _weight = 0.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
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
            height: 50,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Your Height in cm',
                style: TextStyle(
                    color: accentColor,
                    fontSize: 25,
                    fontWeight: FontWeight.w300,),
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 10,
              ),
              // HEIGHT INPUT
              TextField(
                controller: _heightController,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                cursorColor: accentColor,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '0',
                  hintStyle: TextStyle(
                    color: accentColor,
                    fontSize: 42,
                  ),
                ),
                style: TextStyle(
                  color: accentColor,
                  fontSize: 42,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Your Weight in kg',
                style: TextStyle(
                    color: accentColor,
                    fontSize: 25,
                    fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: 10,
              ),
              // WEIGHT INPUT
              TextField(
                controller: _weightController,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                cursorColor: accentColor,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '0',
                  hintStyle: TextStyle(
                    color: accentColor,
                    fontSize: 42,
                  ),
                ),
                style: TextStyle(
                  color: accentColor,
                  fontSize: 42,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              // CALCULATE BUTTON
              ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(75),
                ),
                child: Container(
                  width: 150,
                  height: 150,
                  color: accentColor,
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        FocusScope.of(context).unfocus();
                        bool isItChecked = nullTextControl();
                        if(isItChecked == false) {
                          results();
                        }
                      });
                    },
                    child: Text(
                      'Calculate',
                      style: TextStyle(color: mainColor, fontSize: 20.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              // BMI RESULT SECTION
              Container(
                child: Text(
                  'Your BMI : ${_bmiResult.toStringAsFixed(2)}',
                  style: TextStyle(
                      color: accentColor,
                      fontSize: 42,
                      fontWeight: FontWeight.w300),
                ),
              ),
              SizedBox(
                height: 7.5,
              ),
              Container(
                width: 200,
                child: Divider(
                  color: accentColor,
                  height: 1,
                ),
              ),
              SizedBox(
                height: 7.5,
              ),
              Container(
                child: Text(
                  _bmiTextResult,
                  style: TextStyle(
                      color: accentColor,
                      fontSize: 42,
                      fontWeight: FontWeight.w300),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 420,
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BottomBar(barHeight: 100),
                    BottomBar(barHeight: 80),
                    BottomBar(barHeight: 60),
                    BottomBar(barHeight: 40),
                    BottomBar(barHeight: 20),
                    BottomBar(barHeight: 20),
                    BottomBar(barHeight: 40),
                    BottomBar(barHeight: 60),
                    BottomBar(barHeight: 80),
                    BottomBar(barHeight: 100),
                  ],
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
          child: Text(
            'OK',
            style: TextStyle(
                color: mainColor, fontSize: 25, fontWeight: FontWeight.w400),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
      style: AlertStyle(
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
