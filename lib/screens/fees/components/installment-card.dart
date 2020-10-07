import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InstallmentCard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      elevation: 4,
      shape: Border(
          left: BorderSide(
            color: Colors.amber,
            width: 2,
          )
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Fourth Installment", style: TextStyle(fontSize: 16, letterSpacing: 1.0, fontWeight: FontWeight.w700,),),
                Text("English", style: TextStyle(fontSize: 12, letterSpacing: 1.0, fontWeight: FontWeight.w700,),),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("overdue", style: TextStyle(fontSize: 1, letterSpacing: 1.0, fontWeight: FontWeight.w700,),),
                Text("25% of Fee", style: TextStyle(fontSize: 12, letterSpacing: 1.0, fontWeight: FontWeight.w700,),),
              ],
            ),
          ],
        ),
      ),
    );
  }

}

class HistoryRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("15 Feb 2020"),
            Text("2000"),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Divider(color: Colors.amber, ),
        ),
    ],
    );
  }
}
