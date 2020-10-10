import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class PresentContainer extends StatelessWidget {
  final bool isPresent;

  PresentContainer({this.isPresent});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.0,
      width: 20.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: isPresent ? Colors.green : Colors.red,
      ),
//      padding: EdgeInsets.all(3.0),
      child: isPresent ? Text("P", style: TextStyle(color: Colors.white), textAlign: TextAlign.center,) : Text("A", style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
    );
  }
}
