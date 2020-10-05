import 'package:dsapp/models/models.dart';
import 'package:dsapp/utils/common.dart';
import 'package:flutter/material.dart';

class ExamsCard extends StatelessWidget {
  final ExamsModel exams;

  ExamsCard({this.exams});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      elevation: 4,
      shape: Border(
          left: BorderSide(
            color: Colors.amber,
            width: 2,
          )
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(exams.term.name, style: TextStyle(fontSize: 16, letterSpacing: 1.0, fontWeight: FontWeight.w700,),),
            SizedBox(height: 10.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Start Date : " + Common.formatDate(exams.startDate), style: TextStyle(fontSize: 12,),),
                Text("End Date : " + Common.formatDate(exams.endDate), style: TextStyle(fontSize: 12.0),),
              ],
            )
          ],
        ),
      ),
    );
  }
}
