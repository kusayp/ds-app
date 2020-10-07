import 'package:equatable/equatable.dart';

abstract class ExamScoreEvent extends Equatable {
  ExamScoreEvent();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class FetchingExamScoreEvent extends ExamScoreEvent {
  final String examinationId;
  FetchingExamScoreEvent({this.examinationId});
  @override
  // TODO: implement props
  List<Object> get props => [];
}