import 'package:dsapp/models/models.dart';
import 'package:equatable/equatable.dart';

abstract class MenuEvent extends Equatable {
  const MenuEvent();
}

class MenuDropDownSelected extends MenuEvent {
  final SchoolModel school;
  final String role;
  final UserModel user;

  MenuDropDownSelected({this.school, this.role, this.user});

  @override
  List<Object> get props => [school, role, user];
}

class NotificationIconClicked extends MenuEvent {
  final String school;
  NotificationIconClicked({this.school});

  @override
  // TODO: implement props
  List<Object> get props => [];

}