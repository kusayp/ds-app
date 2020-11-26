import 'package:dsapp/models/models.dart';
import 'package:equatable/equatable.dart';

abstract class AttendanceState extends Equatable {
  AttendanceState();
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class AttendanceEmptyState extends AttendanceState {}

class AttendanceLoadedState extends AttendanceState {
  final ClassRegisterPageData classRegisterPageData;

  AttendanceLoadedState({this.classRegisterPageData});

  @override
  // TODO: implement props
  List<Object> get props => [classRegisterPageData];
}

class AttendanceLoadingState extends AttendanceState {}

class AttendanceErrorState extends AttendanceState {
  final String error;

  AttendanceErrorState(this.error);
}