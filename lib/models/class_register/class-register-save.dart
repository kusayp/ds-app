import 'package:equatable/equatable.dart';

class ClassRegisterSave extends Equatable {
  final int user;
  final int schedule;
  final bool present;
  final int role;

  ClassRegisterSave({this.user, this.schedule, this.present, this.role});

  static Map<String, dynamic> toJson(ClassRegisterSave classRegisterSave) => {
    'user': classRegisterSave.user,
    'schedule': classRegisterSave.schedule,
    'present': classRegisterSave.present,
    'role': classRegisterSave.role,
  };


  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}