import 'package:dsapp/models/fees/installments-model.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/screens/screens.dart';
import 'package:flutter/material.dart';

class FeeInstallmentView extends StatelessWidget {
  final InstallmentsModel installmentsModel;

  const FeeInstallmentView({Key key, this.installmentsModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var installments = [
      "First Installment", "Second Installment", "Third Installment",
    ];
    return ListView.builder(
      itemCount: installmentsModel.numberOfInstallment,
      itemBuilder: (BuildContext context, int index){
        installmentsModel.installment[index].type = installments[index];
        print(index);
        return InstallmentCard(installment: installmentsModel.installment[index],);
      },
    );
  }
}

class FeeHistoryView extends StatelessWidget {
  final PaymentList paymentList;

  const FeeHistoryView({Key key, this.paymentList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Tuition Fee"),
            Text("Due Date: 12 Mar 2020"),
          ],
        ),
        SizedBox(height: 10.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Pending"),
            Text("1000"),
          ],
        ),
        SizedBox(height: 20.0,),
        Expanded(
          child: ListView.builder(
            itemCount: paymentList.list.length,
            itemBuilder: (BuildContext context, int index){
              return HistoryRow(paymentsModel: paymentList.list[index],);
            },
          ),
        ),
      ],
    );
  }
}