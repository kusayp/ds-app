import 'package:dsapp/generated/l10n.dart';
import 'package:dsapp/screens/screens.dart';
import 'package:dsapp/utils/style.dart';
import 'package:flutter/material.dart';

class UpdatePasswordDialog extends StatelessWidget {
  final String text;
  final VoidCallback updatePassword;

  const UpdatePasswordDialog({Key key, this.text, this.updatePassword}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Container(
        height: 300,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(text, style: TextStyle(fontSize: 16.0),),
                SizedBox(height: 20,),
                CustomLoginField(
                  width: 240.0,
                  labelText: "Phone or Email",
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
                    ),
//                  controller: _emailController,
                    keyboardType: TextInputType.text,
                  ),
                ),
                LoginButton(buttonText: S.of(context).ok, onButtonPressed: updatePassword,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
