import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/models/menu-arguments.dart';
import 'package:dsapp/screens/login/components/login-field-component.dart';
import 'package:dsapp/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  final _passwordController = TextEditingController();

  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
//    final _loginBloc = BlocProvider.of<LoginBloc>(context);
    double width = MediaQuery.of(context).size.width;

    _onLoginButtonPressed() {

      BlocProvider.of<LoginBloc>(context).add(LoginButtonPressed(
          username: _emailController.text, password: _passwordController.text));
    }

    void _showError(String error) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(error),
        backgroundColor: Theme.of(context).errorColor,
      ));
    }

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          _showError(state.error);
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          if (state is LoginSuccess) {
            Future.delayed(Duration(milliseconds: 5)  ,() => Navigator.pushNamed(context, '/menu', arguments: state.loginResponse));

          }if (state is LoginInitial){
            return Padding(
              padding: const EdgeInsets.only(right: 30.0, left: 30.0),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.height / 2,
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
                              style: TextStyle(color: Colors.black, fontSize: 14),
                            ),
                            SizedBox(height: 20.0,),
                            CustomLoginField(
                              width: width-60.0,
                              labelText: "Phone",
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.circular(5)),
                                border: Border.all(
                                    color: appTheme().primaryColor, width: 1.0),
                              ),
                              formField: TextFormField(
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(left: 10.0),
                                    border: InputBorder.none),
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                              ),
                            ),
                            CustomLoginField(
                              width: width-60.0,
                              labelText: "Password",
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.circular(5)),
                                border: Border.all(
                                    color: appTheme().primaryColor, width: 1.0),
                              ),
                              formField: TextFormField(
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(left: 10.0),
                                    border: InputBorder.none),
                                obscureText: true,
                                autofocus: false,
                                controller: _passwordController,
                              ),
                            ),
                            LoginButton(
                              onButtonPressed: _onLoginButtonPressed,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}