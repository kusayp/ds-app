import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/repositories/repositories.dart';
import 'package:dsapp/screens/attendance/attendace-screen.dart';
import 'package:dsapp/screens/attendance/components/tab_indicator.dart';
import 'package:dsapp/services/services.dart';
import 'package:dsapp/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AttendancePage extends StatelessWidget {
  static const routeName = '/attendance';
  @override
  Widget build(BuildContext context) {
    final MenuArguments arguments = ModalRoute.of(context).settings.arguments;
    final AttendanceRepository repository = AttendanceRepository(attendanceService: AttendanceService());
    return DefaultTabController(
      length: 2,
      child: BlocProvider<AttendanceBloc>(
        create: (context) => AttendanceBloc(repository: repository),
        child: Scaffold(
          appBar: AppBar(
            leading: BackButton(color: Colors.black),
            title: Text(
              "Attendance",
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            bottom: TabBar(
              indicator: CircleTabIndicator(color: Colors.black, radius: 3),
              tabs: [
                Tab(
                  child: Text("Today", style: TextStyle(color: Colors.black),),
                ),
                Tab(
                  child: Text("This Week", style: TextStyle(color: Colors.black),),
                ),
              ],
            ),
          ),
          extendBodyBehindAppBar: true,
          backgroundColor: appTheme().backgroundColor,
          body: AttendanceScreen(userId: arguments.userId,),
        ),
      ),
    );
  }
}
