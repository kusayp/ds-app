import 'package:dsapp/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class TimeTableState extends Equatable {
  const TimeTableState();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class TimeTableEmpty extends TimeTableState {

}

class TimeTableLoading extends TimeTableState {

}

class TimeTableLoaded extends TimeTableState {
  final TimeTablePageData response;
  final String selectedDay;

  TimeTableLoaded({this.response, this.selectedDay});

  @override
  // TODO: implement props
  List<Object> get props => [response, selectedDay];
}

class TimeTableError extends TimeTableState {

}

class DaySelectedState extends TimeTableState{
  final String day;
  DaySelectedState({this.day = "Monday"});

  void updateDaySelected(String day){
    day = day;
  }
}

class DaySelected extends ChangeNotifier {
  final String day;

  DaySelected({this.day = "Monday"});

  void updateDaySelected(String day){
    day = day;
    notifyListeners();
  }
}