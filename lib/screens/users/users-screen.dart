import 'package:dsapp/utils/style.dart';
import 'package:flutter/material.dart';

class UsersScreen extends StatefulWidget {
  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  Widget build(BuildContext context) {
//    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: appTheme().backgroundColor,
      body: Column(
//        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 400.0,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50.0, left: 50.0, right: 50.0),
            child: Container(
//            height: size.height / 2,
//              color: Colors.amber,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                      color: appTheme().primaryColor,
                      onPressed: () => _getUserTapped(1),
                      child: Text('Login with Email',
                          style: TextStyle(fontSize: 14, color: Colors.white)),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                      color: appTheme().primaryColor,
                      onPressed: () => _getUserTapped(2),
                      child: Text('Login with Reg. Number',
                          style: TextStyle(fontSize: 14, color: Colors.white)),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                      color: appTheme().primaryColor,
                      onPressed: () =>  _getUserTapped(3),
                      child: Text('Login with Phone',
                          style: TextStyle(fontSize: 14, color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
          )
//
        ],
      ),
    );
  }

  void _getUserTapped(int id) {
    Navigator.pushNamed(context, '/login', arguments: id);
  }
}
