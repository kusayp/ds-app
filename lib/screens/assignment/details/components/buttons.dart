import 'package:dsapp/utils/style.dart';
import 'package:flutter/material.dart';

class AttachButton extends StatelessWidget {
  final VoidCallback onButtonPressed;
  final String buttonText;

  const AttachButton({Key key, this.onButtonPressed, this.buttonText}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          right: 20.0, left: 20.0, top: 40.0	),
      child: SizedBox(
        width: 100.0,
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
