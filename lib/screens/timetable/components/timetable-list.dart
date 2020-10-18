import 'package:dart_random_choice/dart_random_choice.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class TimeTableList extends StatelessWidget {
  final TimeTableModel timeTable;

  final List<String> entries = <String>['7B9AD0', 'F9A58B', 'CAB3E9', 'A6D3FC', 'F6BB5F'];

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
          color: Hexcolor(randomChoice(entries)),
          child: ListTile(
            title: Text(timeTable.subject.name, style: ThemeText.timeTableSubjectText,),
            subtitle: Text(timeTable.teacher.firstName + " " + timeTable.teacher.lastName, style: ThemeText.timeTableTeacherText,),
          ),
        )
      ],
    );
  }
}
