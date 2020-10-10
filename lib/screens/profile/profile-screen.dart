import 'package:dsapp/models/models.dart';
import 'package:dsapp/screens/login/components/login-field-component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ProfileScreen extends StatelessWidget {
  final UserModel user;

  ProfileScreen({this.user});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/payment/download.jpeg'),
                radius: 70.0,
              ),
            ),
          ),
          SizedBox(height: 5.0,),
          Text("Charlotte Dawen".toUpperCase(), style: TextStyle(fontSize: 24,), textAlign: TextAlign.center,),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
            child: Text("Class 3", style: TextStyle(fontSize: 14), textAlign: TextAlign.center,),
          ),
          Flexible(
            fit: FlexFit.tight,
            child: Container(
              padding: EdgeInsets.all(10.0),
              height: MediaQuery.of(context).size.height / 4,
              color: Colors.black12,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Email:"),
                      Text("joseph@gmail.com"),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:10.0, bottom: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Phone:"),
                        Text("0201234567"),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Address:"),
                      Text("12th street, holme"),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Subjects:"),
                        Column(
                          children: [
                            Text("Mathematics"),
                            Text("Mathematics"),
                            Text("Mathematics"),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Contact School:"),
                      Column(
                        children: [
                          Text("Mathematics School"),
                          Text("Mathematics"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: LoginButton(buttonText: "Update Password",),
          )
        ],
      ),
    );
  }
}
