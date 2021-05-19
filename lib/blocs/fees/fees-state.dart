import 'package:dsapp/models/models.dart';
import 'package:equatable/equatable.dart';

abstract class FeesState extends Equatable {
  FeesState();
  @override
  List<Object> get props => [];
}

class FeesEmptyState extends FeesState {}

class FeesInitialState extends FeesState {}

class FeesLoadedState extends FeesState {
  final FeesPageData feesPageData;

  FeesLoadedState({this.feesPageData});

  @override
  List<Object> get props => [feesPageData];
}

class FeesLoadingState extends FeesState {}

class FeesPaidState extends FeesState {}

class FeesErrorState extends FeesState {
  final String errorMessage;
  final KKiaPayModel item;

  FeesErrorState(this.errorMessage, {this.item});
}

class SendPaymentToApiErrorState extends FeesState {
  final String errorMessage;
  final KKiaPayModel item;

  SendPaymentToApiErrorState(this.errorMessage, this.item);
}
