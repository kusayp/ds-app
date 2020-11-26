import 'package:dsapp/models/fees/installments-model.dart';
import 'package:dsapp/models/models.dart';
import 'package:equatable/equatable.dart';

abstract class InstallmentsState extends Equatable {
  InstallmentsState();
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class InstallmentsEmptyState extends InstallmentsState {}

class InstallmentsInitialState extends InstallmentsState {}

class InstallmentsLoadedState extends InstallmentsState {
  final InstallmentsModel installmentList;
  final PaymentList paymentList;

  InstallmentsLoadedState({this.paymentList, this.installmentList});

  @override
  // TODO: implement props
  List<Object> get props => [installmentList];
}

class InstallmentsLoadingState extends InstallmentsState {}

class InstallmentsErrorState extends InstallmentsState {
  final String errorMessage;

  InstallmentsErrorState(this.errorMessage);
}