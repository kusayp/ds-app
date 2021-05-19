import 'package:dsapp/generated/l10n.dart';
import 'package:dsapp/utils/style.dart';
import 'package:flutter/material.dart';

class UsersScreen extends StatefulWidget {
  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme().backgroundColor,
      body: Column(
        children: <Widget>[
          Container(
            height: 400.0,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50.0, left: 50.0, right: 50.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                      color: appTheme().primaryColor,
                      onPressed: () => _getUserTapped(3),
                      child: Text(S.of(context).loginWithEmail,
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
                      child: Text(S.of(context).loginWithRegNumber,
                          style: TextStyle(fontSize: 14, color: Colors.white)),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                      color: appTheme().primaryColor,
                      onPressed: () => _getUserTapped(1),
                      child: Text(S.of(context).loginWithPhone,
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
