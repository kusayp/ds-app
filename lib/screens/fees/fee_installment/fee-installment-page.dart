import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/generated/l10n.dart';
import 'package:dsapp/models/fees/installments-arguments.dart';
import 'package:dsapp/repositories/repositories.dart';
import 'package:dsapp/screens/attendance/components/tab_indicator.dart';
import 'package:dsapp/services/services.dart';
import 'package:dsapp/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../screens.dart';

class FeeInstallmentPage extends StatelessWidget {
  static const routeName = '/installments';
  @override
  Widget build(BuildContext context) {
    final FeesRepository repository = FeesRepository(feesService: FeesService());
    final InstallmentArgument arguments = ModalRoute.of(context).settings.arguments;

    return DefaultTabController(
      length: 2,
        child: BlocProvider(
          create: (context) => InstallmentsBloc(repository: repository),
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(color: Colors.black),
          title: Text(
            arguments.name,
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          bottom: TabBar(
            indicator: CircleTabIndicator(color: Colors.black, radius: 3),
            tabs: [
              Tab(
                child: Text(S.of(context).installment, style: TextStyle(color: Colors.black),),
              ),
              Tab(
                child: Text(S.of(context).history, style: TextStyle(color: Colors.black),),
              ),
            ],
          ),
        ),
        extendBodyBehindAppBar: true,
        backgroundColor: appTheme().backgroundColor,
        body: FeeInstallmentScreen(
          arguments: arguments,
        ),
      ),
    )
    );
  }
}
