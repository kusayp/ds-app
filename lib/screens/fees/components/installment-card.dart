import 'package:dsapp/generated/l10n.dart';
import 'package:dsapp/models/fees/installment.dart';
import 'package:dsapp/models/fees/installments-model.dart';
import 'package:dsapp/utils/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InstallmentCard extends StatelessWidget{
  final Installment installment;

  const InstallmentCard({Key key, this.installment}) : super(key: key);
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(installment.type, style: TextStyle(fontSize: 16, letterSpacing: 1.0, fontWeight: FontWeight.w700,),),
                Text(S.of(context).dueDate + Common.formatDate(installment.dueDate), style: TextStyle(fontSize: 12, letterSpacing: 1.0, fontWeight: FontWeight.w700,),),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(S.of(context).overdue, style: TextStyle(fontSize: 1, letterSpacing: 1.0, fontWeight: FontWeight.w700,),),
                Text(installment.percentage.toString() + "% of Fee", style: TextStyle(fontSize: 12, letterSpacing: 1.0, fontWeight: FontWeight.w700,),),
              ],
            ),
          ],
        ),
      ),
    );
  }

}

class HistoryRow extends StatelessWidget {
  final PaymentsModel paymentsModel;

  const HistoryRow({Key key, this.paymentsModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(Common.formatDate(paymentsModel.date)),
            Text(paymentsModel.amount.toString()),
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
