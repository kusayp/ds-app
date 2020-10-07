import 'package:dsapp/screens/attendance/components/tab_indicator.dart';
import 'package:dsapp/utils/style.dart';
import 'package:flutter/material.dart';

import '../../screens.dart';

class FeeInstallmentPage extends StatelessWidget {
  static const routeName = '/installments';
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(color: Colors.black),
          title: Text(
            "Attendance",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          bottom: TabBar(
            indicator: CircleTabIndicator(color: Colors.black, radius: 3),
            tabs: [
              Tab(
                child: Text("Installment", style: TextStyle(color: Colors.black),),
              ),
              Tab(
                child: Text("History", style: TextStyle(color: Colors.black),),
              ),
            ],
          ),
        ),
        extendBodyBehindAppBar: true,
        backgroundColor: appTheme().backgroundColor,
        body: FeeInstallmentScreen(),
      ),
    );
  }
}
