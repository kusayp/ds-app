import 'package:dsapp/blocs/assignment/assignment.dart';
import 'package:dsapp/repositories/repositories.dart';
import 'package:dsapp/screens/assignment/assignment-screen.dart';
import 'package:dsapp/services/services.dart';
import 'package:dsapp/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AssignmentPage extends StatelessWidget {
  static const routeName = '/assignment';
  @override
  Widget build(BuildContext context) {
    final AssignmentRepository repository = AssignmentRepository(assignmentService: AssignmentService());
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        title: Text(
          "Assignment",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: appTheme().backgroundColor,
      body: BlocProvider(
        create: (context) => AssignmentBloc(repository: repository),
        child: AssignmentScreen(),
      ),
    );
  }
}
