import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/repositories/repositories.dart';
import 'package:dsapp/screens/screens.dart';
import 'package:dsapp/services/services.dart';
import 'package:dsapp/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnswerPage extends StatelessWidget {
  static const routeName = '/answers';
  @override
  Widget build(BuildContext context) {
    final AssignmentRepository repository = AssignmentRepository(answerService: AnswerService());
    final AssignmentModel arguments = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        title: Text(
          "Submitted Assignments",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: appTheme().backgroundColor,
      body: BlocProvider(
        create: (context) => AnswerBloc(repository: repository),
        child: AnswerScreen(assignment: arguments,),
      ),
    );
  }
}
