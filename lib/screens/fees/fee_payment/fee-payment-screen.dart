import 'package:dsapp/screens/login/components/login-field-component.dart';
import 'package:dsapp/screens/screens.dart';
import 'package:dsapp/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FeePaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void showPaymentDialog(){
      showDialog(
          context: context,
          builder: (_) => PaymentAlertDialog(),
          barrierDismissible: false
      );
//      Navigator.pushNamed(context, FeeInstallmentPage.routeName,);
    }

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 50, bottom: 50, right: 30, left: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset("assets/images/payment/Credit Card.svg",),
                  SvgPicture.asset("assets/images/payment/Master Card.svg",),
                  SvgPicture.asset("assets/images/payment/Visa Card.svg",),
                ],
              ),
              SizedBox(height: 30.0,),
              CustomField(
                width: MediaQuery.of(context).size.width - 60,
                labelText: "Name",
                decoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.all(Radius.circular(5)),
                  border: Border.all(
                      color: appTheme().primaryColor, width: 1.0),
                ),
                formField: TextFormField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10.0),
                      border: InputBorder.none),
//                controller: _emailController,
                  keyboardType: TextInputType.text,
                ),
              ),
              CustomField(
                width: MediaQuery.of(context).size.width - 60,
                labelText: "Card Number",
                decoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.all(Radius.circular(5)),
                  border: Border.all(
                      color: appTheme().primaryColor, width: 1.0),
                ),
                formField: TextFormField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10.0),
                      border: InputBorder.none),
//                controller: _emailController,
                  keyboardType: TextInputType.text,
                ),
              ),
              SizedBox(height: 20.0,),
              Row(
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: CustomShortField(
                      width: (MediaQuery.of(context).size.width - 90) / 2,
                      labelText: "Expiry Date",
                      decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.all(Radius.circular(5)),
                        border: Border.all(
                            color: appTheme().primaryColor, width: 1.0),
                      ),
                      formField: TextFormField(
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 10.0),
                            border: InputBorder.none),
//                controller: _emailController,
                        keyboardType: TextInputType.text,
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0,),
                  Flexible(
                    child: CustomShortField(
                      width: (MediaQuery.of(context).size.width - 90) / 2,
                      labelText: "CVV",
                      decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.all(Radius.circular(5)),
                        border: Border.all(
                            color: appTheme().primaryColor, width: 1.0),
                      ),
                      formField: TextFormField(
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 10.0),
                            border: InputBorder.none),
//                controller: _emailController,
                        keyboardType: TextInputType.text,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 60.0,),
              Align(
                alignment: Alignment.bottomCenter,
                child: LoginButton(buttonText: "PAY", onButtonPressed: showPaymentDialog,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
