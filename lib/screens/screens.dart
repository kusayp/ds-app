import 'package:flutter/material.dart';

export 'answer/answer.dart';
export 'assignment/assignment.dart';
export 'chat/chat.dart';
export 'exams/exams.dart';
export 'fees/fees.dart';
export 'login/login.dart';
export 'menu/menu.dart';
export 'profile/profile.dart';

class EmptyWidget extends StatelessWidget {
  final String emptyMessage;

  const EmptyWidget({Key key, this.emptyMessage}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Icon(
            Icons.do_not_disturb,
            size: 50.0,
            color: Colors.black,
            semanticLabel: emptyMessage,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Text(
            emptyMessage,
            style: TextStyle(fontSize: 20.0),
          ),
        ],
      ),
    );
  }
}

void showLoading(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            CircularProgressIndicator(),
            Text("Please wait...", textAlign: TextAlign.center),
          ],
        ),
      );
    },
  );
}
