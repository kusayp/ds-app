import 'package:dsapp/screens/attendance/components/attendance-view.dart';
import 'package:flutter/material.dart';

class AttendanceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: TabBarView(
          children: [
            AttendanceDayView(),
            AttendanceWeekView(),
          ],
        ),
      ),
    );
  }
}
