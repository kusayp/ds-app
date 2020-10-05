import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/repositories/repositories.dart';
import 'package:dsapp/screens/exams/exams-screen.dart';
import 'package:dsapp/services/services.dart';
import 'package:dsapp/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExamsPage extends StatelessWidget {
  static const routeName = '/exam';
  @override
  Widget build(BuildContext context) {
    final ExamsRepository repository = ExamsRepository(examsService: ExamsService());
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        title: Text(
          "Exams",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: appTheme().backgroundColor,
      body: BlocProvider(
        create: (context) => ExamsBloc(repository: repository),
        child: ExamsScreen(),
      ),
    );
  }
}
