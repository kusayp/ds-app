import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/repositories/repositories.dart';
import 'package:dsapp/screens/fees/fees-screen.dart';
import 'package:dsapp/services/services.dart';
import 'package:dsapp/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeesPage extends StatelessWidget {
  static const routeName = '/fees';
  @override
  Widget build(BuildContext context) {
    final FeesRepository repository = FeesRepository(feesService: FeesService());
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        title: Text(
          "Fees",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: appTheme().backgroundColor,
      body: BlocProvider(
        create: (context) => FeesBloc(repository: repository),
        child: FeesScreen(),
      ),
    );
  }
}
