import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/repositories/repositories.dart';
import 'package:dsapp/screens/login/login-screen.dart';
import 'package:dsapp/services/services.dart';
import 'package:dsapp/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LoginRepository repository = LoginRepository(loginService: LoginService());
    return Scaffold(
      backgroundColor: appTheme().backgroundColor,
      body: BlocProvider(
        create: (context) => LoginBloc(loginRepository: repository),
        child: LoginScreen(),
      ),
    );
  }
}
