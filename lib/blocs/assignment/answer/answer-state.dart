import 'package:dsapp/models/models.dart';
import 'package:equatable/equatable.dart';

abstract class AnswerState extends Equatable {
  AnswerState();
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class AnswerEmptyState extends AnswerState {}

class AnswerLoadedState extends AnswerState {
  final AnswerPageData answerPageData;
  final String role;

  AnswerLoadedState({this.answerPageData, this.role});

  @override
  // TODO: implement props
  List<Object> get props => [answerPageData];
}

class AnswerLoadingState extends AnswerState {}

class AnswerSavedState extends AnswerState {}

class AnswerErrorState extends AnswerState {
  final String errorMessage;

  AnswerErrorState(this.errorMessage);
}