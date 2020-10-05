import 'package:flutter/material.dart';

class PresentContainer extends StatelessWidget {
  final bool isPresent;

  PresentContainer({this.isPresent});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
      color: isPresent ? Colors.green : Colors.red,
      child: isPresent ? Text("P") : Text("A"),
    );
  }
}
