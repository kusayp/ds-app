import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/generated/l10n.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/repositories/repositories.dart';
import 'package:dsapp/screens/screens.dart';
import 'package:dsapp/services/services.dart';
import 'package:dsapp/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddAssignmentPage extends StatelessWidget {
  static const routeName = '/add-assignment';
  @override
  Widget build(BuildContext context) {
    final MenuArguments arguments = ModalRoute.of(context).settings.arguments;
    final AssignmentRepository repository = AssignmentRepository(assignmentService: AssignmentService());
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        title: Text(
          S().addAssignment,
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: appTheme().backgroundColor,
      body: BlocProvider(
        create: (context) => AddAssignmentBloc(repository: repository),
        child: AddAssignmentScreen(
          school: arguments.roleModules.school,
          user: arguments.roleModules.user,
          arguments: arguments,
        ),
      ),
    );
  }
}