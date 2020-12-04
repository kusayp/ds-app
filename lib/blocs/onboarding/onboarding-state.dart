import 'package:dsapp/models/menu/menu.dart';
import 'package:dsapp/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class OnBoardingState extends Equatable {
  const OnBoardingState();

  @override
  List<Object> get props => [];
}

class OnBoardingEmpty extends OnBoardingState {
  @override
  String toString() => 'OnBoardingStateEmpty';
}

class OnBoardingLoading extends OnBoardingState {}

class OnBoardingLoaded extends OnBoardingState {
  final OnBoardingModelList onBoardingModelList;

  const OnBoardingLoaded({@required this.onBoardingModelList}) : assert(onBoardingModelList != null);

  @override
  List<Object> get props => [onBoardingModelList];
}

class OnBoardingError extends OnBoardingState {}

class OnBoardingViewedState extends OnBoardingState {}

class OnBoardingUserLoggedIn extends OnBoardingState {
  final List<Module> modules;

  OnBoardingUserLoggedIn({this.modules});
}