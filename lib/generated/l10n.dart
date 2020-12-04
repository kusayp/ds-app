// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Submit assignment`
  String get submittedAssignments {
    return Intl.message(
      'Submit assignment',
      name: 'submittedAssignments',
      desc: '',
      args: [],
    );
  }

  /// `Due`
  String get due {
    return Intl.message(
      'Due',
      name: 'due',
      desc: '',
      args: [],
    );
  }

  /// `Digital School`
  String get flutterDemo {
    return Intl.message(
      'Digital School',
      name: 'flutterDemo',
      desc: '',
      args: [],
    );
  }

  /// `Subject:`
  String get subject {
    return Intl.message(
      'Subject:',
      name: 'subject',
      desc: '',
      args: [],
    );
  }

  /// `Fees`
  String get fees {
    return Intl.message(
      'Fees',
      name: 'fees',
      desc: '',
      args: [],
    );
  }

  /// `Submit Answer`
  String get submitAnswer {
    return Intl.message(
      'Submit Answer',
      name: 'submitAnswer',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `DS APP`
  String get appName {
    return Intl.message(
      'DS APP',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Submitted Answers`
  String get submittedAnswers {
    return Intl.message(
      'Submitted Answers',
      name: 'submittedAnswers',
      desc: '',
      args: [],
    );
  }

  /// `Loading...`
  String get loading {
    return Intl.message(
      'Loading...',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `Answer successfully submitted`
  String get answerSuccessfullySubmitted {
    return Intl.message(
      'Answer successfully submitted',
      name: 'answerSuccessfullySubmitted',
      desc: '',
      args: [],
    );
  }

  /// `Choose File`
  String get chooseFile {
    return Intl.message(
      'Choose File',
      name: 'chooseFile',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `Assignment score successfully saved`
  String get assignmentScoreSuccessfullySaved {
    return Intl.message(
      'Assignment score successfully saved',
      name: 'assignmentScoreSuccessfullySaved',
      desc: '',
      args: [],
    );
  }

  /// `No attachment`
  String get noAttachment {
    return Intl.message(
      'No attachment',
      name: 'noAttachment',
      desc: '',
      args: [],
    );
  }

  /// `Obtain`
  String get obtain {
    return Intl.message(
      'Obtain',
      name: 'obtain',
      desc: '',
      args: [],
    );
  }

  /// `Result:`
  String get result {
    return Intl.message(
      'Result:',
      name: 'result',
      desc: '',
      args: [],
    );
  }

  /// `Mark`
  String get mark {
    return Intl.message(
      'Mark',
      name: 'mark',
      desc: '',
      args: [],
    );
  }

  /// `Assignment`
  String get assignment {
    return Intl.message(
      'Assignment',
      name: 'assignment',
      desc: '',
      args: [],
    );
  }

  /// `Add Assignment`
  String get addAssignment {
    return Intl.message(
      'Add Assignment',
      name: 'addAssignment',
      desc: '',
      args: [],
    );
  }

  /// `Current Week`
  String get currentWeek {
    return Intl.message(
      'Current Week',
      name: 'currentWeek',
      desc: '',
      args: [],
    );
  }

  /// `Teacher:`
  String get teacher {
    return Intl.message(
      'Teacher:',
      name: 'teacher',
      desc: '',
      args: [],
    );
  }

  /// `Assignment date:`
  String get assignmentDate {
    return Intl.message(
      'Assignment date:',
      name: 'assignmentDate',
      desc: '',
      args: [],
    );
  }

  /// `Due date:`
  String get dueDate {
    return Intl.message(
      'Due date:',
      name: 'dueDate',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Attachments`
  String get attachments {
    return Intl.message(
      'Attachments',
      name: 'attachments',
      desc: '',
      args: [],
    );
  }

  /// `View Submission`
  String get viewSubmission {
    return Intl.message(
      'View Submission',
      name: 'viewSubmission',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get title {
    return Intl.message(
      'Title',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `School Class`
  String get schoolClass {
    return Intl.message(
      'School Class',
      name: 'schoolClass',
      desc: '',
      args: [],
    );
  }

  /// `Class Subject`
  String get classSubject {
    return Intl.message(
      'Class Subject',
      name: 'classSubject',
      desc: '',
      args: [],
    );
  }

  /// `Attach File`
  String get attachFile {
    return Intl.message(
      'Attach File',
      name: 'attachFile',
      desc: '',
      args: [],
    );
  }

  /// `Create Assignment`
  String get createAssignment {
    return Intl.message(
      'Create Assignment',
      name: 'createAssignment',
      desc: '',
      args: [],
    );
  }

  /// `Attendance`
  String get attendance {
    return Intl.message(
      'Attendance',
      name: 'attendance',
      desc: '',
      args: [],
    );
  }

  /// `Today`
  String get today {
    return Intl.message(
      'Today',
      name: 'today',
      desc: '',
      args: [],
    );
  }

  /// `This Week`
  String get thisWeek {
    return Intl.message(
      'This Week',
      name: 'thisWeek',
      desc: '',
      args: [],
    );
  }

  /// `Chat`
  String get chat {
    return Intl.message(
      'Chat',
      name: 'chat',
      desc: '',
      args: [],
    );
  }

  /// `Class Groups`
  String get classGroups {
    return Intl.message(
      'Class Groups',
      name: 'classGroups',
      desc: '',
      args: [],
    );
  }

  /// `Type a message`
  String get typeAMessage {
    return Intl.message(
      'Type a message',
      name: 'typeAMessage',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Class Register`
  String get classRegister {
    return Intl.message(
      'Class Register',
      name: 'classRegister',
      desc: '',
      args: [],
    );
  }

  /// `Save Class Register`
  String get saveClassRegister {
    return Intl.message(
      'Save Class Register',
      name: 'saveClassRegister',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to continue?`
  String get doYouWantToContinue {
    return Intl.message(
      'Do you want to continue?',
      name: 'doYouWantToContinue',
      desc: '',
      args: [],
    );
  }

  /// `SAVE`
  String get save {
    return Intl.message(
      'SAVE',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continueText {
    return Intl.message(
      'Continue',
      name: 'continueText',
      desc: '',
      args: [],
    );
  }

  /// `Class register successfully saved`
  String get classRegisterSuccessfullySaved {
    return Intl.message(
      'Class register successfully saved',
      name: 'classRegisterSuccessfullySaved',
      desc: '',
      args: [],
    );
  }

  /// `Class Prefect`
  String get classPrefect {
    return Intl.message(
      'Class Prefect',
      name: 'classPrefect',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Exams`
  String get exams {
    return Intl.message(
      'Exams',
      name: 'exams',
      desc: '',
      args: [],
    );
  }

  /// `Start Date:`
  String get startDate {
    return Intl.message(
      'Start Date:',
      name: 'startDate',
      desc: '',
      args: [],
    );
  }

  /// `End Date:`
  String get endDate {
    return Intl.message(
      'End Date:',
      name: 'endDate',
      desc: '',
      args: [],
    );
  }

  /// `MARKED`
  String get marked {
    return Intl.message(
      'MARKED',
      name: 'marked',
      desc: '',
      args: [],
    );
  }

  /// `No Data Found`
  String get noDataFound {
    return Intl.message(
      'No Data Found',
      name: 'noDataFound',
      desc: '',
      args: [],
    );
  }

  /// `Obtained Mark :`
  String get obtainedMark {
    return Intl.message(
      'Obtained Mark :',
      name: 'obtainedMark',
      desc: '',
      args: [],
    );
  }

  /// `Installment`
  String get installment {
    return Intl.message(
      'Installment',
      name: 'installment',
      desc: '',
      args: [],
    );
  }

  /// `History`
  String get history {
    return Intl.message(
      'History',
      name: 'history',
      desc: '',
      args: [],
    );
  }

  /// `Make Payment`
  String get makePayment {
    return Intl.message(
      'Make Payment',
      name: 'makePayment',
      desc: '',
      args: [],
    );
  }

  /// `overdue`
  String get overdue {
    return Intl.message(
      'overdue',
      name: 'overdue',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Reg. Number`
  String get regNumber {
    return Intl.message(
      'Reg. Number',
      name: 'regNumber',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `SignIn`
  String get signin {
    return Intl.message(
      'SignIn',
      name: 'signin',
      desc: '',
      args: [],
    );
  }

  /// `NOTIFICATIONS`
  String get notifications {
    return Intl.message(
      'NOTIFICATIONS',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `No notifications received`
  String get noNotificationsReceived {
    return Intl.message(
      'No notifications received',
      name: 'noNotificationsReceived',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get getStarted {
    return Intl.message(
      'Get Started',
      name: 'getStarted',
      desc: '',
      args: [],
    );
  }

  /// `Address:`
  String get address {
    return Intl.message(
      'Address:',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Classes:`
  String get classes {
    return Intl.message(
      'Classes:',
      name: 'classes',
      desc: '',
      args: [],
    );
  }

  /// `Children:`
  String get children {
    return Intl.message(
      'Children:',
      name: 'children',
      desc: '',
      args: [],
    );
  }

  /// `Contact School:`
  String get contactSchool {
    return Intl.message(
      'Contact School:',
      name: 'contactSchool',
      desc: '',
      args: [],
    );
  }

  /// `Update Password`
  String get updatePassword {
    return Intl.message(
      'Update Password',
      name: 'updatePassword',
      desc: '',
      args: [],
    );
  }

  /// `Timetable`
  String get timetable {
    return Intl.message(
      'Timetable',
      name: 'timetable',
      desc: '',
      args: [],
    );
  }

  /// `Login with Email`
  String get loginWithEmail {
    return Intl.message(
      'Login with Email',
      name: 'loginWithEmail',
      desc: '',
      args: [],
    );
  }

  /// `Login with Reg. Number`
  String get loginWithRegNumber {
    return Intl.message(
      'Login with Reg. Number',
      name: 'loginWithRegNumber',
      desc: '',
      args: [],
    );
  }

  /// `Login with Phone`
  String get loginWithPhone {
    return Intl.message(
      'Login with Phone',
      name: 'loginWithPhone',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'fr'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}