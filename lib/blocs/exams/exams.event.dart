import 'package:equatable/equatable.dart';

abstract class ExamsEvent extends Equatable {
  ExamsEvent();

  @override
  List<Object> get props => [];
}

class FetchingExamsEvent extends ExamsEvent {
  FetchingExamsEvent();
  @override
  List<Object> get props => [];
}