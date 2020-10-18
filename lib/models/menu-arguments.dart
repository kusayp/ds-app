import 'package:dsapp/models/models.dart';

class MenuArguments1 {
  final List<SchoolModel> schools;
  final UserModel user;

  MenuArguments1({this.user, this.schools});
}

class AssignmentArguments{
  final AssignmentModel assignment;
  final String role;

  AssignmentArguments({this.assignment, this.role});

}

class AssignmentAnswerArguments{
  final AssignmentModel assignment;
  final MenuArguments menuArguments;

  AssignmentAnswerArguments({this.assignment, this.menuArguments});

}

class MenuArguments {
  final String userId;
  final Module module;
  final RoleModules roleModules;

  MenuArguments({this.userId, this.module,this.roleModules});
}