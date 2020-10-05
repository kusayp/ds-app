import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/models/timetable/timetable-test.dart';
import 'package:dsapp/repositories/repositories.dart';
import 'package:dsapp/screens/timetable/timetable-screen.dart';
import 'package:dsapp/services/services.dart';
import 'package:dsapp/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimeTablePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final TimeTableRepository repository = TimeTableRepository(tableService: TimeTableService());
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        title: Text(
          "Timetable",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: appTheme().backgroundColor,
      body: BlocProvider(
        create: (context) => TimeTableBloc(repository: repository),
        child: TimeTableScreen(),
      ),
    );
  }

  final timetable = [
    TimeTableTest(
      id: 1,
      title: "English",
      subTitle: "Mr. Kyle",
      startTime: "8:00AM",
      endTime: "9:00AM"
    ),
    TimeTableTest(
        id: 1,
        title: "English",
        subTitle: "Mr. Kyle",
        startTime: "8:00AM",
        endTime: "9:00AM"
    ),
    TimeTableTest(
        id: 1,
        title: "English",
        subTitle: "Mr. Kyle",
        startTime: "8:00AM",
        endTime: "9:00AM"
    ),
    TimeTableTest(
        id: 1,
        title: "English",
        subTitle: "Mr. Kyle",
        startTime: "8:00AM",
        endTime: "9:00AM"
    ),
    TimeTableTest(
        id: 1,
        title: "English",
        subTitle: "Mr. Kyle",
        startTime: "8:00AM",
        endTime: "9:00AM"
    ),
    TimeTableTest(
        id: 1,
        title: "English",
        subTitle: "Mr. Kyle",
        startTime: "8:00AM",
        endTime: "9:00AM"
    ),
    TimeTableTest(
        id: 1,
        title: "English",
        subTitle: "Mr. Kyle",
        startTime: "8:00AM",
        endTime: "9:00AM"
    ),
    TimeTableTest(
        id: 1,
        title: "English",
        subTitle: "Mr. Kyle",
        startTime: "8:00AM",
        endTime: "9:00AM"
    )
  ];
}
