import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/models/timetable/days.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class DaysButton extends StatelessWidget {
  final Day day;
  final TimeTableLoaded state;

  DaysButton({this.day, this.state});

  @override
  Widget build(BuildContext context) {
    final isSelected = state.selectedDay == day.day;
    return GestureDetector(
      onTap: () {
        if (!isSelected){
          BlocProvider.of<TimeTableBloc>(context).add(GetTimeTableFromDayEvent(day: day.day));
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: isSelected ? Colors.amber : Colors.transparent,
        ),
        height: 50.0,
        width: 50.0,
//                        color: Colors.amber,
        child: Center(
          child: Text(
            day.daySlug,
            style: TextStyle(
              fontSize: 20.0,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
