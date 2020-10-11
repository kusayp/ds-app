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
  final RoleModules roleModules;
  final List<Module> modules;
  final SchoolModel school;
  final String role;

  MenuSuccess({@required this.modules, this.school, this.role, this.roleModules}) : assert(roleModules!= null);

  @override
  List<Object> get props => [modules, role, school, roleModules];
}

class MenuFailure extends MenuState {
  final String error;

  MenuFailure({@required this.error});

  @override
  List<Object> get props => [error];
}