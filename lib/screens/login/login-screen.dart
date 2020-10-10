import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/screens/login/components/login-field-component.dart';
import 'package:dsapp/screens/screens.dart';
import 'package:dsapp/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  bool _validate = false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    _onLoginButtonPressed() {
//      setState: _validate = _emailController.text.isEmpty;
      setState(() {
        _emailController.text.isEmpty ? _validate = true : _validate = false;
      });
      if(!_validate){
        BlocProvider.of<LoginBloc>(context).add(LoginButtonPressed(
            username: _emailController.text, password: _passwordController.text));
      }
    }

//    void _showError(String error) {
//      Scaffold.of(context).showSnackBar(SnackBar(
//        content: Text(error),
//        backgroundColor: Theme.of(context).errorColor,
//      ));
//    }

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
//          _showError(state.error);
          showDialog(
              context: context,
              builder: (_) => UserNotFoundDialog(),
              barrierDismissible: false
          );
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          if (state is LoginSuccess) {
            Future.delayed(Duration(milliseconds: 5)  ,() => Navigator.pushNamedAndRemoveUntil(context, '/menu', ModalRoute.withName('/menu'), arguments: state.loginResponse));

          }
          if (state is LoginInitial){
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
                                  border: InputBorder.none,
                                  errorText: _validate ? 'Value Can\'t Be Empty' : null,
                                ),
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
                                  border: InputBorder.none,
                                  errorText: _validate ? 'Value Can\'t Be Empty' : null,
                                ),
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
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}