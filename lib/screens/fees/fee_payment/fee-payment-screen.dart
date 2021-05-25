import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/generated/l10n.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/screens/login/components/login-field-component.dart';
import 'package:dsapp/screens/screens.dart';
import 'package:dsapp/utils/common-constants.dart';
import 'package:dsapp/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kkiapay_flutter_sdk/kkiapayWebview.dart';
// import 'package:kkiapay_flutter_sdk/utils/Kkiapay.dart';

class FeePaymentScreen extends StatefulWidget {
  final KKiaPayArguments item;

  const FeePaymentScreen({Key key, this.item}) : super(key: key);
  @override
  _FeePaymentScreenState createState() => _FeePaymentScreenState();
}

class _FeePaymentScreenState extends State<FeePaymentScreen> {
  // TextEditingController _name = TextEditingController();
  TextEditingController _amount = TextEditingController();
  // TextEditingController _phone = TextEditingController();
  bool callback = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void popScreen() {
      Navigator.pop(context);
    }

    void goToBloc(String transactionId, int amount) {
      BlocProvider.of<FeesBloc>(context).add(KkiaPaymentEvent(
        klass: widget.item.schoolClass,
        student: widget.item.student,
        fee: widget.item.fee,
        amount: amount,
        transactionId: transactionId,
      ));
    }

    void showPaymentDialog(response, context) async {
      popScreen();
      goToBloc(response['transactionId'], response['amount']);
    }

    return BlocListener<FeesBloc, FeesState>(
      listener: (context, state) {
        if (state is FeesPaidState) {
          popScreen();
          showDialog(
            context: context,
            builder: (_) => PaymentAlertDialog(
              message: S.of(context).paymentSuccessfulText,
              note: S.of(context).thankYouText,
              onPressed: popScreen,
            ),
            barrierDismissible: false,
          );
        }

        if (state is FeesLoadingState) {
          showLoading(context);
        }

        if (state is FeesErrorState) {
          popScreen();
          showDialog(
            context: context,
            builder: (_) => PaymentAlertDialog(
              message: S.of(context).paymentUnsuccessfullyText,
              note: S.of(context).tryAgain,
              onPressed: () {
                popScreen();
                BlocProvider.of<FeesBloc>(context).add(
                  KkiaPaymentEvent(
                    klass: state.item.schoolClass,
                    student: state.item.student,
                    fee: state.item.fee,
                    amount: state.item.amount,
                    transactionId: state.item.transactionId,
                  ),
                );
              },
            ),
            barrierDismissible: false,
          );
        }
      },
      child: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 50, bottom: 50, right: 30, left: 30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      "assets/images/payment/Credit Card.svg",
                    ),
                    SvgPicture.asset(
                      "assets/images/payment/Master Card.svg",
                    ),
                    SvgPicture.asset(
                      "assets/images/payment/Visa Card.svg",
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
                CustomField(
                  width: MediaQuery.of(context).size.width - 60,
                  labelText: S.of(context).p_amount,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    border:
                        Border.all(color: appTheme().primaryColor, width: 1.0),
                  ),
                  formField: TextFormField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10.0),
                        border: InputBorder.none),
                    controller: _amount,
                    keyboardType: TextInputType.text,
                    validator: (amount) =>
                        amount.isEmpty ? S.of(context).amountErrorString : null,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.10,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: LoginButton(
                    buttonText: S.of(context).p_pay,
                    onButtonPressed: () {
                      if (_amount.value.text.isNotEmpty) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => KKiaPay(
                              callback: showPaymentDialog,
                              amount: int.parse(_amount.text.toString()),
                              sandbox: true,
                              apikey: CommonConstants.apiKey,
                            ),
                          ),
                        );
                        // _amount.clear();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
