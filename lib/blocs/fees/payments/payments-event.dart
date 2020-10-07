import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class PaymentEvent extends Equatable {
  const PaymentEvent();
}

class PaymentButtonPressed extends PaymentEvent {
  final String username;
  final String password;

  PaymentButtonPressed({@required this.username, @required this.password});

  @override
  List<Object> get props => [username, password];
}