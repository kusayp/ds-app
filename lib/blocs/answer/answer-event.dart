import 'package:equatable/equatable.dart';

abstract class AnswerEvent extends Equatable {
  AnswerEvent();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class FetchingAnswerEvent extends AnswerEvent {
  final int assignmentId;
  FetchingAnswerEvent({this.assignmentId});
  @override
  // TODO: implement props
  List<Object> get props => [];
}