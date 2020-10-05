import 'package:dsapp/theme/style.dart';
import 'package:flutter/material.dart';

class CustomLoginField extends StatelessWidget {
  final String labelText;
  final BoxDecoration decoration;
  final TextFormField formField;
  final double width;

  const CustomLoginField({this.labelText, this.decoration, this.formField, this.width});
  @override
  Widget build(BuildContext context) {
//    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: <Widget>[
        Container(
          height: 70,
        ),
        Positioned(
          bottom: 0,
          child: Container(width: width, height: 50, decoration: decoration, child: formField,),
        ),
        Positioned(
          left: 30,
          bottom: 40,
          child: Container(color: Colors.white, child: Text(labelText, textAlign: TextAlign.center,), width: 70.0,),
        )
      ],
    );
  }
}

class LoginButton extends StatelessWidget{
  final VoidCallback onButtonPressed;
  final String buttonText;

  LoginButton({this.onButtonPressed, this.buttonText="SignIn"});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(
          right: 20.0, left: 20.0, top: 40.0	),
      child: SizedBox(
        width: double.infinity,
        height: 50.0,
        child: RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0)),
          color: appTheme().primaryColor,
          onPressed: onButtonPressed,
          child: Text(buttonText,
              style: TextStyle(
                  fontSize: 14, color: Colors.white)),
        ),
      ),
    );
  }
}