import 'package:equatable/equatable.dart';

abstract class OnBoardingEvent extends Equatable {
  const OnBoardingEvent();
}

class FetchOnBoarding extends OnBoardingEvent {
  const FetchOnBoarding();

  @override
  List<Object> get props => [];

}

class OnBoardingViewedEvent extends OnBoardingEvent {
  const OnBoardingViewedEvent();

  @override
  List<Object> get props => [];

}

class OnBoardingUserLoggedInEvent extends OnBoardingEvent {
  const OnBoardingUserLoggedInEvent();

  @override
  List<Object> get props => [];

}