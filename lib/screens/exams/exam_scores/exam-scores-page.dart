import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/repositories/repositories.dart';
import 'package:dsapp/services/services.dart';
import 'package:dsapp/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../screens.dart';

class ExamsScorePage extends StatelessWidget {
  static const routeName = '/exam_score';
  @override
  Widget build(BuildContext context) {
    final ExamsModel arguments = ModalRoute.of(context).settings.arguments;
    final ExamsRepository repository = ExamsRepository(examsService: ExamsService());
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        title: Text(
          arguments.term.name,
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: appTheme().backgroundColor,
      body: BlocProvider(
        create: (context) => ExamScoreBloc(repository: repository),
        child: ExamScoreScreen(exam: arguments,),
      ),
    );
  }
}
