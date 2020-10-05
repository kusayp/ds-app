import 'package:dsapp/screens/assignment/assignment-page.dart';
import 'package:dsapp/screens/attendance/attendance-page.dart';
import 'package:dsapp/screens/chat/chat-page.dart';
import 'package:dsapp/screens/class_register/class-register-page.dart';
import 'package:dsapp/screens/exams/exams-page.dart';
import 'package:dsapp/screens/fees/fees-page.dart';
import 'package:dsapp/screens/login/login-page.dart';
import 'package:dsapp/screens/logout.dart';
import 'package:dsapp/screens/menu/menu-page.dart';
import 'package:dsapp/screens/onboarding/onboarding-page.dart';
import 'package:dsapp/screens/profile/profile-page.dart';
import 'package:dsapp/screens/screens.dart';
import 'package:dsapp/screens/timetable/timetable-page.dart';
import 'package:dsapp/screens/timetable/timetable-screen.dart';
import 'package:dsapp/screens/users/users-screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder> {
  "/": (BuildContext context) {
    return OnBoardingPageScreen();
    },
  "/users": (BuildContext context) => UsersScreen(),
  "/login": (BuildContext context) => LoginPage(),
  "/logout": (BuildContext context) => LogOut(),
  MenuPage.routeName: (BuildContext context) => MenuPage(),
  TimeTableScreen.routeName: (BuildContext context) => TimeTablePage(),
  AssignmentPage.routeName: (BuildContext context) => AssignmentPage(),
  ExamsPage.routeName: (BuildContext context) => ExamsPage(),
  FeesPage.routeName: (BuildContext context) => FeesPage(),
  AttendancePage.routeName: (BuildContext context) => AttendancePage(),
  ChatPage.routeName: (BuildContext context) => ChatPage(),
  ClassRegisterPage.routeName: (BuildContext context) => ClassRegisterPage(),
  ProfilePage.routeName: (BuildContext context) => ProfilePage(),
  AssignmentDetailPage.routeName: (BuildContext context) => AssignmentDetailPage(),
  SubmitAnswerPage.routeName: (BuildContext context) => SubmitAnswerPage(),
  AnswerPage.routeName: (BuildContext context) => AnswerPage()
};