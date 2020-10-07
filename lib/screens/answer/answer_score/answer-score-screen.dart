import 'package:dsapp/generated/l10n.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/screens/answer/answer-page.dart';
import 'package:dsapp/screens/login/components/login-field-component.dart';
import 'package:dsapp/utils/style.dart';
import 'package:flutter/material.dart';

class AnswerScoreScreen extends StatelessWidget {
  final AnswerModel answer;

  AnswerScoreScreen({this.answer});

  @override
  Widget build(BuildContext context) {
    void pushToAssignmentScorePage(){
      Navigator.pushNamed(context, AnswerPage.routeName);
    }
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 40.0),
              height: MediaQuery.of(context).size.height / 5,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(S.of(context).subject, style: textSmallStyle),
                      Text(answer.assignment.title, style: textSmallBlackStyle),
                    ],
                  ),
                  SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(S.of(context).subject, style: textSmallStyle),
                      Text(answer.assignment.title, style: textSmallBlackStyle),
                    ],
                  ),
                  SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(S.of(context).subject, style: textSmallStyle),
                      Text(answer.assignment.title, style: textSmallBlackStyle),
                    ],
                  ),
                  SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(S.of(context).subject, style: textSmallStyle),
                      Text(answer.assignment.title, style: textSmallBlackStyle),
                    ],
                  ),
                  SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(S.of(context).subject, style: textSmallStyle),
                      Text(answer.assignment.title, style: textSmallBlackStyle),
                    ],
                  ),
                  SizedBox(height: 5,),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60.0, bottom: 100.0),
              child: Container(
                height: 30.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black26),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(answer.attachment??"No attachment"),
                  ),
                ),
              ),
            ),
            Divider(
              thickness: 1.0,
              height: 0.8,
              color: Colors.black12,
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 20.0),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Obtain"),
                    SizedBox(width: 20,),
                    Container(
                      height: 30.0,
                      width: 70.0,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1.5)
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10.0),
                        ),
                      ),
                    ),
                    SizedBox(width: 20,),
                    Text("/"),
                    SizedBox(width: 20,),
                    Container(
                      height: 30.0,
                      width: 70.0,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1.5)
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Result:"),
                  SizedBox(width: 30,),
                  Switch(value: true, onChanged: (value){}),
                ],
              ),
            ),
            LoginButton(
              buttonText: "Mark",
            )
          ],
        ),
      ),
    );
  }
}
