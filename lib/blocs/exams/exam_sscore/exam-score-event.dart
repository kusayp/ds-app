import 'package:equatable/equatable.dart';

abstract class ExamScoreEvent extends Equatable {
  ExamScoreEvent();

  @override
  List<Object> get props => [];
}

class FetchingExamScoreEvent extends ExamScoreEvent {
  final String examinationId;
  FetchingExamScoreEvent({this.examinationId});
  @override
  List<Object> get props => [];
}