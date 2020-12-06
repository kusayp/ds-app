import 'package:dsapp/generated/l10n.dart';
import 'package:dsapp/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomLoginField extends StatelessWidget {
  final String labelText;
  final BoxDecoration decoration;
  final Widget formField;
  final double width;
  final double textWidth;

  CustomLoginField({this.labelText, this.decoration, this.formField, this.width, this.textWidth = 70.0});
  @override
  Widget build(BuildContext context) {
//    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: <Widget>[
        Container(
          height: 70,
        ),
        Positioned(
          bottom: 0,
          child: Container(width: width, height: 50, decoration: decoration, child: formField,),
        ),
        Positioned(
          left: 30,
          bottom: 40,
          child: Container(color: Colors.white, child: Text(labelText, textAlign: TextAlign.center,), width: textWidth,),
        )
      ],
    );
  }
}

class CustomField extends StatelessWidget {
  final String labelText;
  final BoxDecoration decoration;
  final TextFormField formField;
  final double width;

  CustomField({this.labelText, this.decoration, this.formField, this.width});
  @override
  Widget build(BuildContext context) {
//    double width = MediaQuery.of(context).size.width;
    return Container(
      height: 70,
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 0,
            child: Container(width: width, height: 50, decoration: decoration, child: formField,),
          ),
          Positioned(
            left: 30,
            bottom: 40,
            child: Container(color: Colors.white, child: Text(labelText, textAlign: TextAlign.center, style: ThemeText.loginInText,), width: 100.0,),
          )
        ],
      ),
    );
  }
}

class CustomShortField extends StatelessWidget {
  final String labelText;
  final BoxDecoration decoration;
  final TextFormField formField;
  final double width;

  CustomShortField({this.labelText, this.decoration, this.formField, this.width});
  @override
  Widget build(BuildContext context) {
//    double width = MediaQuery.of(context).size.width;
    return Container(
      height: 70,
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 0,
            child: Container(width: width, height: 50, decoration: decoration, child: formField,),
          ),
          Positioned(
            left: 30,
            bottom: 40,
            child: Container(color: Colors.white, child: Text(labelText, textAlign: TextAlign.center, ), width: 90.0,),
          )
        ],
      ),
    );
  }
}

class LoginButton extends StatelessWidget{
  final VoidCallback onButtonPressed;
  final String buttonText;

  LoginButton({this.onButtonPressed, this.buttonText});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(
          right: 20.0, left: 20.0, top: 10	),
      child: SizedBox(
        width: double.infinity,
        height: 50.0,
        child: RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0)),
          color: appTheme().primaryColor,
          onPressed: onButtonPressed,
          child: Text(buttonText,
              style: TextStyle(
                  fontSize: 14, color: Colors.white)),
        ),
      ),
    );
  }
}

class UserNotFoundDialog extends StatelessWidget {
  final VoidCallback onButtonPressed;

  const UserNotFoundDialog({Key key, this.onButtonPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Container(
        height: 400,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset("assets/icons/User not found.svg"),
              Text("We cannot find a match for a user using the information provided", style: TextStyle(fontSize: 16.0),),
              Text("Please check and retry again with the correct information", style: TextStyle(fontSize: 16.0),),
              LoginButton(buttonText: S.of(context).ok, onButtonPressed: onButtonPressed,),
            ],
          ),
        ),
      ),
    );
  }
}

class ErrorDialog extends StatelessWidget {
  final String errorMessage;
  final VoidCallback onButtonPressed;

  const ErrorDialog({Key key, this.errorMessage, this.onButtonPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
//    void goBack(){
//      Navigator.pop(context);
//    }
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Container(
        height: 200,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.error, size: 50.0, color: Colors.red,),
//              SvgPicture.asset("assets/icons/User not found.svg"),
              SizedBox(height: 10.0,),
                Text(errorMessage, style: TextStyle(fontSize: 16.0),),
                SizedBox(height: 10.0,),
//              Text("Please check and retry again with the correct information", style: TextStyle(fontSize: 16.0),),
                LoginButton(buttonText: "OK", onButtonPressed: onButtonPressed,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NoConnectionDialog extends StatelessWidget {
  final VoidCallback onButtonPressed;

  const NoConnectionDialog({Key key, this.onButtonPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Container(
        height: 500,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Oops !", style: TextStyle(fontSize: 24.0),),
              SvgPicture.asset("assets/icons/No Connection.svg"),
              Text("Check your connection and try again", style: TextStyle(fontSize: 16.0),),
              LoginButton(buttonText: "OK", onButtonPressed: onButtonPressed,),
            ],
          ),
        ),
      ),
    );
  }
}
