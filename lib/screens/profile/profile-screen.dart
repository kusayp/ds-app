import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/images/menu/Profile.svg",
              width: 30,
              height: 30,
            ),
            SizedBox(height: 5.0,),
            Text("Charlotte Dawen", style: TextStyle(fontSize: 16), textAlign: TextAlign.center,),
            Text("Class 3", style: TextStyle(fontSize: 14), textAlign: TextAlign.center,),
            Container(),
          ],
        ),
      ),
    );
  }
}
