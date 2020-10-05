import 'package:dsapp/models/menu/menu.dart';
import 'package:dsapp/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class MenuState extends Equatable{
  const MenuState();

  @override
  List<Object> get props => [];
}

class MenuInitial extends MenuState {}

class MenuLoading extends MenuState {}

class MenuSuccess extends MenuState {
  final List<Module> modules;
  final UserModel user;

  MenuSuccess({@required this.modules, this.user}) : assert(modules!= null);

  @override
  List<Object> get props => [modules];
}

class MenuFailure extends MenuState {
  final String error;

  MenuFailure({@required this.error});

  @override
  List<Object> get props => [error];
}