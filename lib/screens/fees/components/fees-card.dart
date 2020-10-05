import 'package:dsapp/models/models.dart';
import 'package:flutter/material.dart';

class FeesCard extends StatelessWidget {
  final FeesModel fees;

  FeesCard({this.fees});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.redAccent,
      child: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(fees.type, style: TextStyle(fontSize: 16, letterSpacing: 1.0, fontWeight: FontWeight.w700,),),
              SizedBox(height: 8.0,),
              Text("Mathematics", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black26),),
              Divider(
                color: Colors.white,
                thickness: 1.2,
              ),
              ListTile(
                leading: Icon(Icons.close,size: 10.0, ),
                title: Text("Pending", style: TextStyle(fontSize: 10.0),),
                trailing: Text("1000.00", style: TextStyle(fontSize: 10.0),),
              ),
            ],
          ),
        ),
    );
  }
}
