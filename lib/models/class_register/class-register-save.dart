import 'package:equatable/equatable.dart';

class ClassRegisterSave extends Equatable {
  final int user;
  final int schedule;
  final bool present;
  final int role;

  ClassRegisterSave({this.user, this.schedule, this.present, this.role});

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}