import 'package:dsapp/screens/attendance/components/present-container.dart';
import 'package:flutter/material.dart';

class AttendanceWeekCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            Text("26 March 2020", style: TextStyle(fontSize: 16, letterSpacing: 1.0, fontWeight: FontWeight.w700,),),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                PresentContainer(isPresent: true,),
                PresentContainer(isPresent: false,),
                PresentContainer(isPresent: true,),
                PresentContainer(isPresent: false,),
                PresentContainer(isPresent: true,),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class AttendanceDayCard extends StatelessWidget{
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
            Text("English", style: TextStyle(fontSize: 16, letterSpacing: 1.0, fontWeight: FontWeight.w700,),),
            SizedBox(
              height: 5.0,
            ),
            Text("Mathematics", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black26),),
            Align(
              alignment: Alignment.centerRight,
              child: PresentContainer(isPresent: true,),
            )
          ],
        ),
      ),
    );
  }

}
