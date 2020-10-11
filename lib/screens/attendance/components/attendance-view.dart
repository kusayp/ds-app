import 'package:dsapp/models/models.dart';
import 'package:dsapp/screens/attendance/components/attendance-card.dart';
import 'package:flutter/material.dart';

class AttendanceWeekView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index){
        return AttendanceWeekCard();
      },
    );
  }
}

class AttendanceDayView extends StatelessWidget {
  final List<ClassRegisterModel> classRegister;

  const AttendanceDayView({Key key, this.classRegister}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: classRegister.length,
      itemBuilder: (BuildContext context, int index){
        return AttendanceDayCard(classRegisterModel: classRegister[index],);
      },
    );
  }
}

