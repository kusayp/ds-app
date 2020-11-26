import 'package:dsapp/models/models.dart';
import 'package:equatable/equatable.dart';

abstract class ExamScoreState extends Equatable {
  ExamScoreState();
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class ExamScoreInitialState extends ExamScoreState {}

class ExamScoreLoadedState extends ExamScoreState {
  final ExamScorePageData examScorePageData;

  ExamScoreLoadedState({this.examScorePageData});

  @override
  // TODO: implement props
  List<Object> get props => [examScorePageData];
}

class ExamScoreLoadingState extends ExamScoreState {}

class ExamScoreErrorState extends ExamScoreState {
  final String errorMessage;

  ExamScoreErrorState(this.errorMessage);
}

class ExamScoreEmptyState extends ExamScoreState {}