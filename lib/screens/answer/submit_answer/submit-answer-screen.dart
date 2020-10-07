import 'package:dsapp/screens/login/components/login-field-component.dart';
import 'package:flutter/material.dart';

class SubmitAnswerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2.5,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: LoginButton(
                  buttonText: "Choose File",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
