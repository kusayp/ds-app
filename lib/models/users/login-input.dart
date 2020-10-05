
import 'package:flutter/foundation.dart';

class LoginInput{
  String username;
  String password;

  LoginInput({@required this.password, @required this.username});

  @override
  String toString() {
    // TODO: implement toString
    return "User { username: $username, password: $password}";
  }
}