import 'package:dsapp/models/models.dart';
import 'package:dsapp/screens/exams/exam_scores/exam-scores-page.dart';
import 'package:dsapp/utils/common.dart';
import 'package:flutter/material.dart';

import '../../screens.dart';

class ExamsCard extends StatelessWidget {
  final ExamsModel exams;

  ExamsCard({this.exams});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, ExamsScorePage.routeName, arguments: exams);
      },
      child: Card(
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
      ),
    );
  }
}

class GroupCard extends StatelessWidget {
  final GroupModel group;

  GroupCard({this.group});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, ChatPage.routeName, arguments: group);
      },
      child: Card(
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
              Text(group.name, style: TextStyle(fontSize: 16, letterSpacing: 1.0, fontWeight: FontWeight.w700,),),
              SizedBox(height: 10.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(group.limit.toString(), style: TextStyle(fontSize: 12,),),
//                  Text(group., style: TextStyle(fontSize: 12.0),),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

