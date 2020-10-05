import 'package:dsapp/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class MenuEvent extends Equatable {
  const MenuEvent();
}

class MenuDropDownSelected extends MenuEvent {
  final SchoolModel school;

  MenuDropDownSelected({@required this.school});

  @override
  List<Object> get props => [school];
}