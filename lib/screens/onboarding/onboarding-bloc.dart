//import 'dart:async';
//import 'dart:ui';
//import 'package:bloc/bloc.dart';
//import 'package:dsapp/models/onboarding/onboarding-model.dart';
//import 'package:dsapp/services/onboarding/onboarding-api.dart';
//import 'package:flutter/services.dart';
////import 'package:example/models/contact.dart';
//import 'package:flutter/material.dart';
//
//class OnBoardingBloc implements Bloc {
//
//  OnBoardingModel onBoardingModel;
////  StreamSubscription _streamSubscription;
//
////  Stream<String> get example => _exampleSubject.stream;
////  Sink<String> get exampleSink => _exampleSubject.sink;
////  final StreamController<String> _exampleSubject = StreamController<String>();
//  final _controller = StreamController<List<OnBoardingModel>>();
//  Stream<List<OnBoardingModel>> get stream => _controller.stream;
//  OnBoardingBloc();
//
//  void getOnBoarding() async{
//    final results = await loadOnBoardingModel();
//    _controller.sink.add(results);
//  }
//
//  @override
//  void dispose() {
//    _controller.close();
//  }
//}
