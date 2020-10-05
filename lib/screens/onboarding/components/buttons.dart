
import 'package:dsapp/utils/style.dart';
import 'package:flutter/material.dart';

class OnBoardingButton extends StatelessWidget {
  final VoidCallback onButtonPressed;
  final String text;

  OnBoardingButton({this.onButtonPressed, this.text});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 60.0, right: 60.0, top: 40, bottom: 50),
        child: RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0)
          ),
          color: appTheme().primaryColor,
          onPressed: onButtonPressed,
          child: Text(text, style: TextStyle(fontSize: 20, color: Colors.white)),
        ),
      ),
    );
  }
}
