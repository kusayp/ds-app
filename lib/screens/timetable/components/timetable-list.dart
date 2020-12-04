import 'package:dart_random_choice/dart_random_choice.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/utils/style.dart';
import 'package:flutter/material.dart';

class TimeTableList extends StatelessWidget {
  final TimeTableModel timeTable;

  final List<int> colors = [0xff7B9AD0, 0xffF9A58B, 0xffCAB3E9, 0xffA6D3FC, 0xffF6BB5F];

  TimeTableList({this.timeTable});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 40.0;
    return Row(
      children: [
        Container(
          width: width*0.25,
          child: Text(timeTable.startTime+ " - "+timeTable.endTime, style: ThemeText.timeTableTimeText,),
        ),
        Container(
          width: width*0.75,
          color: Color(randomChoice(colors)),
          child: ListTile(
            title: Text(timeTable.subject.name, style: ThemeText.timeTableSubjectText,),
            subtitle: Text(timeTable.teacher.firstName + " " + timeTable.teacher.lastName, style: ThemeText.timeTableTeacherText,),
          ),
        )
      ],
    );
  }
}
