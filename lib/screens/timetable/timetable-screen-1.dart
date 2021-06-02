// // Created by Godslove on 5/27/21.
//
// import 'package:dsapp/blocs/blocs.dart';
// import 'package:dsapp/generated/l10n.dart';
// import 'package:dsapp/models/models.dart';
// import 'package:dsapp/screens/screens.dart';
// import 'package:dsapp/screens/timetable/components/days-button.dart';
// import 'package:dsapp/screens/timetable/components/timetable-list.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class TimeTableScreen1 extends StatelessWidget {
//   final String classId;
//   final String teacherId;
//
//   const TimeTableScreen1({Key key, this.classId, this.teacherId})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     List<Widget> buildTimeTableDays(SelectedDay state) {
//       final children = <Widget>[];
//
//       for (int i = 0; i < days.length; i++) {
//         children.add(DaysButton(
//           classId: classId,
//           teacherId: teacherId,
//           day: days[i],
//           state: state,
//         ));
//       }
//       return children;
//     }
//
//     Widget generateTimeTableContent(TimeTableLoaded state) {
//       if (state.response.result.length == 0) {
//         return EmptyWidget(
//           emptyMessage: S.current.noDataFound,
//         );
//       }
//       return ListView.builder(
//           itemCount: state.response.result.length,
//           shrinkWrap: true,
//           itemBuilder: (BuildContext context, int index) {
//             return Container(
//               padding: EdgeInsets.only(
//                 bottom: 20.0,
//               ),
//               child: TimeTableList(
//                 timeTable: state.response.result[index],
//               ),
//             );
//           });
//     }
//
//     return BlocListener<TimeTableBloc, TimeTableState>(
//       listener: (context, state) {
//         if (state is TimeTableError) {}
//
//         if (state is SelectedDay) {
//           BlocProvider.of<TimeTableBloc>(context).add(
//             GetTimeTableFromDayEvent(
//               day: state.selectedDay,
//               classId: classId,
//               teacherId: teacherId,
//             ),
//           );
//         }
//       },
//       child: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.only(right: 20.0, left: 20.0),
//           child: Column(
//             children: [
//               BlocBuilder<TimeTableBloc, TimeTableState>(
//                 builder: (context, state) {
//                   if (state is SelectedDay) {
//                     return Container(
//                       width: MediaQuery.of(context).size.width - 40,
//                       padding: EdgeInsets.only(
//                         top: 20.0,
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: buildTimeTableDays(state),
//                       ),
//                     );
//                   }
//                   return Container();
//                 },
//               ),
//               BlocBuilder<TimeTableBloc, TimeTableState>(
//                 builder: (context, state) {
//                   if (state is TimeTableLoaded) {
//                     return Container(
//                       child: generateTimeTableContent(state),
//                     );
//                   }
//                   return Container();
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
