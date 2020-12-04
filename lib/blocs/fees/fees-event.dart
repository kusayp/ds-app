import 'package:equatable/equatable.dart';

abstract class FeesEvent extends Equatable {
  FeesEvent();

  @override
  List<Object> get props => [];
}

class FetchingFeesEvent extends FeesEvent {
  final String classId;
  final String userId;
  FetchingFeesEvent({this.classId, this.userId});
  @override
  List<Object> get props => [];
}