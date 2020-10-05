import 'package:dsapp/models/models.dart';

class MenuArguments {
  final List<SchoolModel> schools;
  final UserModel user;

  MenuArguments({this.user, this.schools});
}

class AssignmentArguments{
  final AssignmentModel assignment;
  final String role;

  AssignmentArguments({this.assignment, this.role});

}