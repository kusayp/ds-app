import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/generated/l10n.dart';
import 'package:dsapp/models/timetable/days.dart';
import 'package:dsapp/screens/screens.dart';
import 'package:dsapp/screens/timetable/components/days-button.dart';
import 'package:dsapp/screens/timetable/components/timetable-list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimeTableScreen extends StatelessWidget {
  final String classId;
  final String teacherId;

  const TimeTableScreen({Key key, this.classId, this.teacherId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int idValue = DateTime.now().weekday;
    Day currentDay = days[idValue - 1];

    List<Widget> buildTimeTableDays(TimeTableLoaded state) {
      final children = <Widget>[];

      for (int i = 0; i < days.length; i++) {
        children.add(DaysButton(
          classId: classId,
          teacherId: teacherId,
          day: days[i],
          state: state,
        ));
      }
      return children;
    }

    Widget generateTimeTableContent(TimeTableLoaded state) {
      if (state.response.result.length == 0) {
        return EmptyWidget(
          emptyMessage: S.of(context).noDataFound,
        );
      }
      return ListView.builder(
          itemCount: state.response.result.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: EdgeInsets.only(
                bottom: 20.0,
              ),
              child: TimeTableList(
                timeTable: state.response.result[index],
              ),
            );
          });
    }

    void initPage() {
      BlocProvider.of<TimeTableBloc>(context).add(GetTimeTableFromDayEvent(
          day: currentDay.day, classId: classId, teacherId: teacherId));
    }

    void goBack() {
      initPage();
      Navigator.maybePop(context);
    }

    return BlocListener<TimeTableBloc, TimeTableState>(
      listener: (context, state) {
        if (state is TimeTableError) {
          showDialog(
              context: context,
              builder: (_) => ErrorDialog(
                    errorMessage: state.errorMessage,
                    onButtonPressed: goBack,
                  ),
              barrierDismissible: false);
        }
      },
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 20.0, left: 20.0),
          child: BlocBuilder<TimeTableBloc, TimeTableState>(
            builder: (context, state) {
              if (state is TimeTableLoaded) {
                return Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width - 40,
                      padding: EdgeInsets.only(
                        top: 20.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: buildTimeTableDays(state),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 10.0,
                      ),
                    ),
                    Container(
                      child: generateTimeTableContent(state),
                    ),
                  ],
                );
              }
              if (state is TimeTableEmpty) {
                initPage();
              }

              if (state is TimeTableLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              return Container();
            },
          ),
        ),
      ),
    );
  }
}
