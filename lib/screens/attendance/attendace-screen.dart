import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/screens/attendance/components/attendance-view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AttendanceScreen extends StatelessWidget {
  final String userId;

  const AttendanceScreen({Key key, this.userId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AttendanceBloc, AttendanceState>(
      builder: (context, state) {
        if(state is AttendanceLoadedState){
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: TabBarView(
                children: [
                  AttendanceDayView(classRegister: state.classRegisterPageData.result,),
                  AttendanceWeekView(),
                ],
              ),
            ),
          );
        }
        if(state is AttendanceEmptyState){
          BlocProvider.of<AttendanceBloc>(context)
              .add(TodayAttendanceEvent(actorId: userId));
        }
        return Center(
          child: CircularProgressIndicator()
        );
      }
    );
  }
}
