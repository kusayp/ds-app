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
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index){
        return AttendanceDayCard();
      },
    );
  }
}

