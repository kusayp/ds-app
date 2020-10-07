import 'package:dsapp/models/menu/menu.dart';
import 'package:dsapp/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class PaymentState extends Equatable{
  const PaymentState();

  @override
  List<Object> get props => [];
}

class PaymentInitial extends PaymentState {}

class PaymentLoading extends PaymentState {}

class PaymentSuccess extends PaymentState {
  final LoginResponse loginResponse;
  final List<Module> modules;

  PaymentSuccess({@required this.loginResponse, this.modules}) : assert(loginResponse!= null);

  @override
  List<Object> get props => [loginResponse, modules];
}

class PaymentFailure extends PaymentState {
  final String error;

  PaymentFailure({@required this.error});

  @override
  List<Object> get props => [error];
}