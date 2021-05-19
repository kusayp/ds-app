import 'package:equatable/equatable.dart';

abstract class FeesEvent extends Equatable {
  FeesEvent();

  @override
  List<Object> get props => [];
}

class FetchingFeesEvent extends FeesEvent {
  final String classId;
  final String userId;
  FetchingFeesEvent({this.classId, this.userId});
  @override
  List<Object> get props => [];
}

class KkiaPaymentEvent extends FeesEvent {
  // final KKiaPayModel model;
  final int klass;
  final int student;
  // final int payUser;
  final int fee;
  final int amount;
  final String transactionId;
  KkiaPaymentEvent({
    this.klass,
    this.student,
    // this.payUser,
    this.fee,
    this.amount,
    this.transactionId,
    // this.model,
  });
  @override
  List<Object> get props => [];
}
