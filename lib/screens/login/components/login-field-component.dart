import 'package:flutter/material.dart';

class CustomLoginField extends StatelessWidget {
  final String labelText;
  final BoxDecoration decoration;
  final TextFormField formField;

  const CustomLoginField({this.labelText, this.decoration, this.formField});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 70,
        ),
        Positioned(
          bottom: 0,
          child: Container(width: 250, height: 50, decoration: decoration, child: formField,),
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