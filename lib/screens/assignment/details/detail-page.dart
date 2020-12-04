import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/repositories/repositories.dart';
import 'package:dsapp/services/services.dart';
import 'package:dsapp/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../screens.dart';

class AssignmentDetailPage extends StatelessWidget {
  static const routeName = '/assignment-detail';

  @override
  Widget build(BuildContext context) {
    final AssignmentAnswerArguments arguments = ModalRoute.of(context).settings.arguments;
    final AssignmentRepository repository = AssignmentRepository(assignmentService: AssignmentService());
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        title: Text(
          arguments.assignment.title,
          style: ThemeText.onBoardingHeader,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: appTheme().backgroundColor,
      body: BlocProvider(
          create: (context) => AssignmentDetailBloc(repository: repository),
          child: AssignmentDetailScreen(assignment: arguments.assignment, role: arguments.menuArguments ,)),
    );
  }
}
