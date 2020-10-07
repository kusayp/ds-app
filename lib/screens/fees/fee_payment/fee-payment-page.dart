import 'package:dsapp/generated/l10n.dart';
import 'package:dsapp/screens/screens.dart';
import 'package:dsapp/utils/style.dart';
import 'package:flutter/material.dart';

class FeePaymentPage extends StatelessWidget {
  static const routeName = '/fee-payment';
  @override
  Widget build(BuildContext context) {
//    final FeesRepository repository = FeesRepository(feesService: FeesService());
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        title: Text(
          "Payment",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: appTheme().backgroundColor,
      body: FeePaymentScreen(),
    );
  }
}