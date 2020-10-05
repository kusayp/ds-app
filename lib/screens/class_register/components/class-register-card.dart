import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ClassRegisterCard extends StatelessWidget {
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
            ListTile(
              leading: SvgPicture.asset(
                "assets/images/menu/Profile.svg",
                width: 30,
                height: 30,
              ),
              title: Text("Mr. Joseph", style: TextStyle(fontSize: 16, letterSpacing: 1.0, fontWeight: FontWeight.w700,),),
              subtitle: Text("Class Prefect", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black26),),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Switch(
                  value: true,
                  onChanged: (value){
                    print(value);
                  },
                activeColor: Colors.green,
                focusColor: Colors.redAccent,
              ),
            )
          ],
        ),
      ),
    );
  }
}
