import 'package:dsapp/models/models.dart';
import 'package:dsapp/screens/screens.dart';
import 'package:dsapp/utils/style.dart';
import 'package:flutter/material.dart';

class FeesCard extends StatelessWidget {
  final FeesModel fees;

  FeesCard({this.fees});

  @override
  Widget build(BuildContext context) {
//    var colours = {
//      "pending": "#FF0000",
//      "paid": "#69childC9C5",
//      "not yet": "#F7AE03"
//    };

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          FeeInstallmentPage.routeName,
        );
      },
      child: Card(
        color: Colors.redAccent,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10,
            bottom: 10,
            left: 20,
            right: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                fees.type,
                style: TextStyle(
                  fontSize: 16,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                "Mathematics",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.black26),
              ),
              Divider(
                color: Colors.white,
                thickness: 1.2,
              ),
              Row(
                children: [
                  ClipOval(
                    child: Material(
                      color: Colors.white, // button color
                      child: InkWell(
                        child: SizedBox(width: 15.0, height: 15.0, child: Icon(Icons.check, color: Colors.red, size: 14.0,)),
                        onTap: () {},
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "Pending",
                    style: TextStyle(fontSize: 10.0),
                  ),
                  Flexible(fit: FlexFit.tight, child: SizedBox()),
                  Text(
                    fees.amount.toString(),
                    style: TextStyle(fontSize: 10.0),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PaymentAlertDialog1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: AlertDialog(
        title: Center(
          child: ClipOval(
            child: Material(
              color: Colors.green, // button color
              child: InkWell(
                splashColor: Colors.red, // inkwell color
                child: SizedBox(width: 56, height: 56, child: Icon(Icons.check, color: Colors.white, size: 50,)),
                onTap: () {},
              ),
            ),
          ),
        ),
        content: Text("Payment Successfully Received"),
        actions: [FlatButton(onPressed: () => Navigator.pop(context), child: Text("OK"))],
      ),
    );
  }
}

class PaymentAlertDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.circular(5.0)), //this right here
      child: Container(
        height: 200,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipOval(
                  child: Material(
                    color: Colors.green, // button color
                    child: InkWell(
                      splashColor: Colors.red, // inkwell color
                      child: SizedBox(width: 56, height: 56, child: Icon(Icons.check, color: Colors.white, size: 50,)),
                      onTap: () {},
                    ),
                  ),
                ),
              ),
              Text("Payment Successfully Received"),
              SizedBox(
                width: 320.0,
                child: RaisedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Center(
                    child: Text(
                      "OK",
                      style: TextStyle(color: Colors.white,),
                    ),
                  ),
                  color: appTheme().primaryColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

