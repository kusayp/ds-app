import 'package:flutter/material.dart';

class OnlineIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      width: 8,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(20.0)
      ),
    );
  }
}
