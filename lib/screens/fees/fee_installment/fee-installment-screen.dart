import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/generated/l10n.dart';
import 'package:dsapp/models/fees/fees.dart';
import 'package:dsapp/models/fees/installments-arguments.dart';
import 'package:dsapp/screens/fees/fee_payment/fee-payment-page.dart';
import 'package:dsapp/screens/login/components/login-field-component.dart';
import 'package:dsapp/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeeInstallmentScreen extends StatelessWidget {
  final String classId;
  final String userId;
  final String feesId;
  final InstallmentArgument arguments;

  const FeeInstallmentScreen({Key key, this.classId, this.userId, this.feesId, this.arguments}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    void goToPaymentPage(){
      Navigator.pushNamed(context, FeePaymentPage.routeName, arguments: KKiaPayArguments(student: int.parse(arguments.userId), fee: int.parse(arguments.feesId), schoolClass: int.parse(arguments.classId), payerUserId: int.parse(arguments.userId)));
    }

    void initPage() {
      BlocProvider.of<InstallmentsBloc>(context)
          .add(FetchingInstallmentsEvent(classId: arguments.classId, userId: arguments.userId, feesId: arguments.feesId));
    }

    void goBack() {
      initPage();
      Navigator.pop(context);
    }

    return BlocListener<InstallmentsBloc, InstallmentsState>(
    listener: (context, state){

      if (state is InstallmentsErrorState) {
        print(state.errorMessage);
        showDialog(
            context: context,
            builder: (_) => ErrorDialog(
              errorMessage: state.errorMessage,
              onButtonPressed: goBack,
            ),
            barrierDismissible: false);
      }
    },
      child: SafeArea(
        child: BlocBuilder<InstallmentsBloc, InstallmentsState>(
          builder: (context, state) {
            if(state is InstallmentsLoadedState){
              return Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 1.6,
                    padding: EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0),
                    child: TabBarView(
                      children: [
                        FeeInstallmentView(installmentsModel: state.installmentList,),
                        FeeHistoryView(paymentList: state.paymentList,),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: LoginButton(buttonText: S.of(context).makePayment, onButtonPressed: goToPaymentPage,),
                  ),
                ],
              );
            }

            if (state is InstallmentsLoadingState){
              return Center(child: CircularProgressIndicator(),);
            }

            if(state is InstallmentsEmptyState){
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.do_not_disturb, size: 40, color: Colors.black,),
                  SizedBox(),
                  Text(S.of(context).noDataFound, style: TextStyle(fontSize: 20),),
                ],
              );
            }

            if(state is InstallmentsInitialState){
              initPage();
            }

            return Container();
          }
        ),
      ),
    );
  }
}