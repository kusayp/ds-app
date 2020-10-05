import 'package:equatable/equatable.dart';

abstract class TimeTableEvent extends Equatable {
  const TimeTableEvent();
}

class GetDaySelected extends TimeTableEvent {
  final String day;

  GetDaySelected({this.day});

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class GetTimeTableFromDayEvent extends TimeTableEvent {
  final String day;

  GetTimeTableFromDayEvent({this.day});

  @override
  // TODO: implement props
  List<Object> get props => [day];
}
