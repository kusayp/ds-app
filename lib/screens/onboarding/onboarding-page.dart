import 'package:dsapp/models/onboarding/onboarding-model.dart';
import 'package:dsapp/screens/onboarding/onboarding-bloc.dart';
import 'package:dsapp/screens/onboarding/onboarding-screen.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final GlobalKey<ScaffoldState> _globalKey = new GlobalKey<ScaffoldState>();
  OnBoardingBloc onBoardingBloc;

  @override
  void initState() {
    super.initState();

    onBoardingBloc = OnBoardingBloc();
  }

  @override
  void dispose() {
    onBoardingBloc.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      body: OnBoardingScreen(
        bgColor: Colors.white,
        themeColor: const Color(0xFF19283E),
        pages: pages,
        skipClicked: (value) {
          print(value);
          _globalKey.currentState.showSnackBar(SnackBar(
            content: Text("Skip clicked"),
          ));
        },
        getStartedClicked: (value) {
          print(value);
//          Navigator.pushNamed(context, '/users');
          _globalKey.currentState.showSnackBar(SnackBar(
            content: Text("Get Started clicked"),
          ));
        },
      ),
    );
  }

  final pages = [
    OnBoardingModel(
        title: 'Choose your item',
        description:
        'Easily find your grocery items and you will get delivery in wide range Easily find your grocery items and you will get delivery in wide range',
        titleColor: Colors.black,
        descriptionColor: const Color(0xFF929794),
        imagePath: 'assets/icons/Calendar.svg'
    ),
    OnBoardingModel(
        title: 'Pick Up or Delivery',
        description:
        'We make ordering fast, simple and free-no matter if you order online or cash',
        titleColor: Colors.black,
        descriptionColor: const Color(0xFF929794),
        imagePath: 'assets/icons/Calendar.svg'
    ),
    OnBoardingModel(
        title: 'Pay quick and easy',
        description: 'Pay for order using credit or debit card',
        titleColor: Colors.black,
        descriptionColor: const Color(0xFF929794),
        imagePath: 'assets/icons/Calendar.svg'
    ),
  ];
}