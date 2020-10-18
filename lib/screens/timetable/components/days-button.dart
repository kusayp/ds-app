import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/models/timetable/days.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class DaysButton extends StatelessWidget {
  final String classId;
  final String teacherId;
  final Day day;
  final TimeTableLoaded state;

  DaysButton({this.day, this.state, this.teacherId, this.classId});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width-40;
    final isSelected = state.selectedDay == day.day;
    return GestureDetector(
      onTap: () {
        if (!isSelected){
          BlocProvider.of<TimeTableBloc>(context).add(GetTimeTableFromDayEvent(day: day.day, teacherId: teacherId, classId: classId));
        }
      },
      child: Container(
//        margin: EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: isSelected ? Hexcolor('#F9AE18') : Colors.transparent,
        ),
        height: size/7,
        width: size/7,
//                        color: Colors.amber,
        child: Center(
          child: Text(
            day.daySlug,
            style: TextStyle(
              fontSize: 15.0,
              color: isSelected ? Colors.white : Hexcolor(day.color)
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
