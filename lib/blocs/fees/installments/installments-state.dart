import 'package:dsapp/models/models.dart';
import 'package:equatable/equatable.dart';

abstract class InstallmentsState extends Equatable {
  InstallmentsState();
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class InstallmentsEmptyState extends InstallmentsState {}

class InstallmentsLoadedState extends InstallmentsState {
  final FeesPageData feesPageData;

  InstallmentsLoadedState({this.feesPageData});

  @override
  // TODO: implement props
  List<Object> get props => [feesPageData];
}

class InstallmentsLoadingState extends InstallmentsState {}

class InstallmentsErrorState extends InstallmentsState {}