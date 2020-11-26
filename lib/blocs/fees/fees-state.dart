import 'package:dsapp/models/models.dart';
import 'package:equatable/equatable.dart';

abstract class FeesState extends Equatable {
  FeesState();
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class FeesEmptyState extends FeesState {}

class FeesInitialState extends FeesState {}

class FeesLoadedState extends FeesState {
  final FeesPageData feesPageData;

  FeesLoadedState({this.feesPageData});

  @override
  // TODO: implement props
  List<Object> get props => [feesPageData];
}

class FeesLoadingState extends FeesState {}

class FeesErrorState extends FeesState {
  final String errorMessage;

  FeesErrorState(this.errorMessage);
}