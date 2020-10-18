import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData appTheme() {
  return ThemeData(
    fontFamily: 'OpenSans',
    primaryColor: Hexcolor("#19283E"),
    accentColor: Hexcolor("#A3A5B1"),
    textSelectionColor: Hexcolor("#000000"),
    hintColor: Colors.white,
    dividerColor: Colors.white,
    buttonColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    canvasColor: Colors.white,
    backgroundColor: Colors.white,
  );
}

abstract class ThemeText {
  static const TextStyle onBoardingHeader = TextStyle(
    color: Colors.black,
    fontSize: 20,
    height: 0.5,
    fontWeight: FontWeight.bold,
  );

  static TextStyle onBoardingDescription = TextStyle(
    color: Hexcolor("#A3A5B1"),
    fontSize: 14,
    fontWeight: FontWeight.w100,
  );

  static const TextStyle onBoardingSkip = TextStyle(
    color: Colors.black,
    fontSize: 15,
    height: 0.5,
    fontWeight: FontWeight.w300,
  );

  static const TextStyle loginInText = TextStyle(
    color: Colors.black,
    fontSize: 14,
//    height: 0.5,
    fontWeight: FontWeight.w300,
  );

  static const TextStyle menuDropDownText = TextStyle(
    color: Colors.black,
    fontSize: 12,
    height: 0.5,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle menuHeader = TextStyle(
    color: Colors.black,
    fontSize: 18,
    height: 0.5,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle menuItemText = TextStyle(
    color: Colors.black,
    fontSize: 16,
    height: 0.5,
    fontWeight: FontWeight.w600,
  );

  static TextStyle timeTableTimeText = TextStyle(
    color: Hexcolor('#CED3D9'),
    fontSize: 12,
    height: 0.5,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle timeTableSubjectText = TextStyle(
    color: Colors.white,
    fontSize: 18,
    height: 0.5,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle timeTableTeacherText = TextStyle(
    color: Colors.white,
    fontSize: 15,
    height: 0.5,
    fontWeight: FontWeight.w600,
  );

  static TextStyle assignmentPeriodText = TextStyle(
    color: Hexcolor('#84A2D6'),
    fontSize: 10,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle assignmentHeaderText = TextStyle(
    color: Colors.black,
    fontSize: 18,
    height: 0.5,
    fontWeight: FontWeight.w600,
  );

  static TextStyle assignmentSubjectText = TextStyle(
    color: Hexcolor('#A3A5B1'),
    fontSize: 12,
    fontWeight: FontWeight.w600,
  );

  static TextStyle assignmentDateText = TextStyle(
    color: Colors.white,
    fontSize: 11,
    fontWeight: FontWeight.w600,
  );

  static TextStyle assignmentDueDateText = TextStyle(
    color: Hexcolor('#FA8993'),
    fontSize: 12,
    fontWeight: FontWeight.w600,
  );

  static TextStyle assignmentTabTitleText = TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
}