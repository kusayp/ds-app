import 'package:dsapp/screens/assignment/assignment-page.dart';
import 'package:dsapp/screens/attendance/attendance-page.dart';
import 'package:dsapp/screens/chat/chat-page.dart';
import 'package:dsapp/screens/chat/conversation-page.dart';
import 'package:dsapp/screens/class_register/class-register-page.dart';
import 'package:dsapp/screens/fees/fees-page.dart';
import 'package:dsapp/screens/login/login-page.dart';
import 'package:dsapp/screens/logout.dart';
import 'package:dsapp/screens/menu/menu-page.dart';
import 'package:dsapp/screens/onboarding/onboarding-page.dart';
import 'package:dsapp/screens/profile/profile-page.dart';
import 'package:dsapp/screens/screens.dart';
import 'package:dsapp/screens/timetable/timetable-page.dart';
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
  TimeTablePage.routeName: (BuildContext context) => TimeTablePage(),
  AssignmentPage.routeName: (BuildContext context) => AssignmentPage(),
  ExamsPage.routeName: (BuildContext context) => ExamsPage(),
  FeesPage.routeName: (BuildContext context) => FeesPage(),
  AttendancePage.routeName: (BuildContext context) => AttendancePage(),
  GroupPage.routeName: (BuildContext context) => GroupPage(),
  ChatPage.routeName: (BuildContext context) => ChatPage(),
  ConversationPage.routeName: (BuildContext context) => ConversationPage(),
  ClassRegisterPage.routeName: (BuildContext context) => ClassRegisterPage(),
  ProfilePage.routeName: (BuildContext context) => ProfilePage(),
  AssignmentDetailPage.routeName: (BuildContext context) => AssignmentDetailPage(),
  SubmitAnswerPage.routeName: (BuildContext context) => SubmitAnswerPage(),
  AnswerPage.routeName: (BuildContext context) => AnswerPage(),
  AnswerScorePage.routeName: (BuildContext context) => AnswerScorePage(),
  ExamsScorePage.routeName: (BuildContext context) => ExamsScorePage(),
  FeeInstallmentPage.routeName: (BuildContext context) => FeeInstallmentPage(),
  FeePaymentPage.routeName: (BuildContext context) => FeePaymentPage(),
  ParentStudentMenuPage.routeName: (BuildContext context) => ParentStudentMenuPage(),
  AddAssignmentPage.routeName: (BuildContext context) => AddAssignmentPage(),
  NotificationPage.routeName: (BuildContext context) => NotificationPage(),
};