import 'package:equatable/equatable.dart';

abstract class InstallmentsEvent extends Equatable {
  InstallmentsEvent();

  @override
  List<Object> get props => [];
}

class FetchingInstallmentsEvent extends InstallmentsEvent {
  final String classId;
  final String userId;
  final String feesId;
  FetchingInstallmentsEvent({this.classId, this.userId, this.feesId});
  @override
  List<Object> get props => [];
}