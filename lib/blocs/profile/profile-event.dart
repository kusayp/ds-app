import 'package:equatable/equatable.dart';

abstract class ProfileEvent extends Equatable {
  ProfileEvent();

  @override
  List<Object> get props => [];
}

class ProfileSchoolEvent extends ProfileEvent {
  ProfileSchoolEvent();
  @override
  List<Object> get props => [];
}