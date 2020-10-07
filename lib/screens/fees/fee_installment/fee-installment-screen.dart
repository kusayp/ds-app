import 'package:dsapp/screens/fees/fee_payment/fee-payment-page.dart';
import 'package:dsapp/screens/login/components/login-field-component.dart';
import 'package:dsapp/screens/screens.dart';
import 'package:flutter/material.dart';

class FeeInstallmentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void goToPaymentPage(){
      Navigator.pushNamed(context, FeePaymentPage.routeName,);
    }
    return SafeArea(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 1.6,
            padding: EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0),
            child: TabBarView(
              children: [
                FeeInstallmentView(),
                FeeHistoryView(),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: LoginButton(buttonText: "Make Payment", onButtonPressed: goToPaymentPage,),
          ),
        ],
      ),
    );
  }
}
