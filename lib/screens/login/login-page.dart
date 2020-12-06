import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/generated/l10n.dart';
import 'package:dsapp/repositories/repositories.dart';
import 'package:dsapp/screens/login/login-screen.dart';
import 'package:dsapp/services/firebase/firebase-services.dart';
import 'package:dsapp/services/services.dart';
import 'package:dsapp/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int id = ModalRoute.of(context).settings.arguments;
    final LoginRepository repository = LoginRepository(loginService: LoginService(), firebaseService: FirebaseService());
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        title: Text(
          S.of(context).login,
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: appTheme().backgroundColor,
      body: BlocProvider(
        create: (context) => LoginBloc(loginRepository: repository),
        child: LoginScreen(id: id,),
      ),
    );
  }
}
