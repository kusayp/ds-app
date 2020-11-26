import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/screens/login/components/login-field-component.dart';
import 'package:dsapp/screens/screens.dart';
import 'package:dsapp/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  final int id;

  const LoginScreen({Key key, this.id}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  bool _validate = false;
  String code;
//  LoginBloc _loginBloc;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    _loginBloc = LoginBloc();
    code = "+299";
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    Widget _buildDropdownItem(Country country) => Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: Container(
//        width: 60.0,
        child: Row(
          children: <Widget>[
            CountryPickerUtils.getDefaultFlagImage(country),
//          SizedBox(
//            width: 8.0,
//          ),
            Text("+${country.phoneCode}", style: ThemeText.loginInText,),
          ],
        ),
      ),
    );

    Widget loadUserNameField(int id){
      if(id == 1){
        return CustomLoginField(
          width: width-60.0,
          labelText: "Email",
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
        );
      }
      else if(id == 2){
        return CustomLoginField(
          width: width-60.0,
          labelText: "Reg. Number",
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
        );
      }
      else{
        return Row(
          children: [
            CountryPickerDropdown(
              initialValue: 'BJ',
              itemBuilder: _buildDropdownItem,
              priorityList:[
                CountryPickerUtils.getCountryByIsoCode('GH'),
                CountryPickerUtils.getCountryByIsoCode('TG'),
              ],
              sortComparator: (Country a, Country b) => a.isoCode.compareTo(b.isoCode),
              onValuePicked: (Country country) {
                print("${country.phoneCode}");
                setState(() {
                  code = "+${country.phoneCode}";
                });
              },
            ),
            Expanded(
              child: CustomLoginField(
                width: width-180.0,
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
                  keyboardType: TextInputType.phone,
                  autofocus: false,
                ),
              ),
            ),
          ],
        );
      }
    }

    _onLoginButtonPressed() {
      setState(() {
        _emailController.text.isEmpty ? _validate = true : _validate = false;
      });
//      print(code + _emailController.text.replaceFirst(RegExp(r'^0+'), ""));
      if(!_validate){
        BlocProvider.of<LoginBloc>(context).add(LoginButtonPressed(
            username: _emailController.text, password: _passwordController.text));
      }
    }

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
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
            Future.delayed(Duration(milliseconds: 5) ,() => Navigator.pushNamedAndRemoveUntil(context, '/menu', ModalRoute.withName('/menu'), arguments: state.loginResponse));

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
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'LOGIN',
                              textAlign: TextAlign.center,
                              style: ThemeText.loginInText,
                            ),
                            SizedBox(height: 20.0,),
                            loadUserNameField(widget.id),
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
                            SizedBox(height: MediaQuery.of(context).size.height * 0.10,),
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

//          if (state is LoginFailure) {
//            showDialog(
//                context: context,
//                builder: (_) => UserNotFoundDialog(),
//                barrierDismissible: true
//            );
//          }

    if (state is LoginLoading) {
      return Center(child: Text("Loading...", style: TextStyle(fontSize: 20.0), textAlign: TextAlign.center,));
    }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}