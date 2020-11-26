import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/screens/attendance/components/attendance-view.dart';
import 'package:dsapp/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AttendanceScreen extends StatelessWidget {
  final String userId;
  final String classId;

  const AttendanceScreen({Key key, this.userId, this.classId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocListener<AttendanceBloc, AttendanceState>(
    listener: (context, state) {
      if (state is AttendanceErrorState) {
        print(state.error);
//          context.hideLoaderOverlay();
        showDialog(
            context: context,
            builder: (_) => ErrorDialog(
              errorMessage: state.error,
            ),
            barrierDismissible: false);
      }
    },
      child: BlocBuilder<AttendanceBloc, AttendanceState>(
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
                .add(TodayAttendanceEvent(actorId: userId, classId: classId));
          }

          if (state is AttendanceLoadingState){
//                context.showLoaderOverlay();
            return Center(child: Text("Loading...", style: TextStyle(fontSize: 20.0), textAlign: TextAlign.center,));
//                  return CircularProgressIndicator();
          }

          return Center(
            child: CircularProgressIndicator()
          );
        }
      ),
    );
  }
}
