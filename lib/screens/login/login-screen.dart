import 'package:dsapp/screens/login/components/login-field-component.dart';
import 'package:dsapp/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class UserLoginScreen extends StatefulWidget {
  @override
  _UserLoginScreenState createState() => _UserLoginScreenState();
}

class _UserLoginScreenState extends State<UserLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme().backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 50.0, left: 50.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height / 2,
                    ),
                    Positioned(
                      top: 20.0,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop(true);
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text(
                          'LOGIN',
                          textAlign: TextAlign.center,
                        ),
                        CustomLoginField(
                          labelText: "Phone",
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            border: Border.all(
                                color: appTheme().primaryColor, width: 1.0),
                          ),
                          formField: TextFormField(
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 10.0),
                                border: InputBorder.none),
                          ),
                        ),
                        CustomLoginField(
                          labelText: "Password",
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            border: Border.all(
                                color: appTheme().primaryColor, width: 1.0),
                          ),
                          formField: TextFormField(
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 10.0),
                                border: InputBorder.none),
                            obscureText: true,
                            autofocus: false,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 20.0, left: 20.0, top: 40.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0)),
                              color: appTheme().primaryColor,
                              onPressed: () {
                                Navigator.pushNamed(context, '/menu');
                              },
                              child: Text('SignIn',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
