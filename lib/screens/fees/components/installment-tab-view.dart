import 'package:dsapp/screens/screens.dart';
import 'package:flutter/material.dart';

class FeeInstallmentView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index){
        return InstallmentCard();
      },
    );
  }
}

class FeeHistoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Tuition Fee"),
            Text("Due Date: 12 Mar 2020"),
          ],
        ),
        SizedBox(height: 10.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Pending"),
            Text("1000"),
          ],
        ),
        SizedBox(height: 20.0,),
        Expanded(
          child: ListView.builder(
            itemCount: 7,
            itemBuilder: (BuildContext context, int index){
              return HistoryRow();
            },
          ),
        ),
      ],
    );
  }
}