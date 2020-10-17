import 'package:dsapp/models/models.dart';
import 'package:equatable/equatable.dart';

abstract class ClassRegisterState extends Equatable {
  ClassRegisterState();
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class ClassRegisterEmptyState extends ClassRegisterState {}

class ClassRegisterToggledState extends ClassRegisterState {
  final List<UserModel> users;
  final List<TimeTableModel> schedules;
  final TimeTableModel selectedSchedules;
  final String selectedSchoolClass;
  final int timeStamp;

  ClassRegisterToggledState({this.users, this.schedules, this.selectedSchedules, this.timeStamp, this.selectedSchoolClass});

  @override
  // TODO: implement props
  List<Object> get props => [users, schedules, selectedSchedules, timeStamp, selectedSchoolClass];
}

class ClassRegisterScheduleLoadedState extends ClassRegisterState{
  final TimeTablePageData tablePageData;

  ClassRegisterScheduleLoadedState({this.tablePageData});

  @override
  // TODO: implement props
  List<Object> get props => [tablePageData];
}

class ClassRegisterLoadedState extends ClassRegisterState {
  final List<UserModel> users;
  final List<TimeTableModel> schedules;
  final TimeTableModel selectedSchedules;
  final String selectedSchoolClass;
  final int timeStamp;

  ClassRegisterLoadedState({this.users, this.schedules, this.selectedSchedules, this.timeStamp, this.selectedSchoolClass});

  @override
  // TODO: implement props
  List<Object> get props => [users, schedules, selectedSchedules, timeStamp, selectedSchoolClass];
}

class ClassRegisterLoadingState extends ClassRegisterState {}

class ClassRegisterToggleLoadingState extends ClassRegisterState {}

class ClassRegisterSavedState extends ClassRegisterState {}

class ClassRegisterErrorState extends ClassRegisterState {}