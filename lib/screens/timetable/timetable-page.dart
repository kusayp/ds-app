import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/repositories/repositories.dart';
import 'package:dsapp/screens/timetable/timetable-screen.dart';
import 'package:dsapp/services/services.dart';
import 'package:dsapp/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimeTablePage extends StatelessWidget {
  static const routeName = '/timetable';

  @override
  Widget build(BuildContext context) {

    final TimeTableRepository repository = TimeTableRepository(tableService: TimeTableService());
    final MenuArguments arguments = ModalRoute.of(context).settings.arguments;
    String studentClass (){
      if (arguments.roleModules.user.studentClass != null){
        return arguments.roleModules.user.studentClass?.id.toString();
      }
       return arguments.roleModules.school.studentClass.id.toString();
    }

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        title: Text(
          "Timetable",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: appTheme().backgroundColor,
      body: BlocProvider(
        create: (context) => TimeTableBloc(repository: repository),
        child: TimeTableScreen(
//          classId: arguments.module.studentUser.studentClass.id.toString(),
          classId: studentClass(),
          teacherId: arguments.roleModules.user.id.toString(),
        ),
      ),
    );
  }
}
