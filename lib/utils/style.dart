import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData appTheme() {
  return ThemeData(
    fontFamily: 'OpenSans',
    primaryColor: Hexcolor("#19283E"),
    accentColor: Hexcolor("#84A2D6"),
    textSelectionColor: Hexcolor("#000000"),
    hintColor: Colors.white,
    dividerColor: Colors.white,
    buttonColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    canvasColor: Colors.white,
    backgroundColor: Colors.white,
  );
}

final TextStyle appBarTitleStyle = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
  color: appTheme().textSelectionColor,
);

final TextStyle textSmallStyle = TextStyle(
  fontSize: 14.0,
  color: Colors.black26,
);

final TextStyle textSmallBlackStyle = TextStyle(
  fontSize: 14.0,
  color: Colors.black,
);