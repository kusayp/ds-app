import 'package:dsapp/bloc/bloc-prov-tree.dart';
import 'package:dsapp/bloc/bloc-prov.dart';
import 'package:dsapp/blocs/auth-bloc.dart';
import 'package:dsapp/blocs/pref-bloc.dart';
import 'package:dsapp/routes.dart';
import 'package:dsapp/theme/style.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProviderTree(
      blocProviders: <BlocProvider>[
        BlocProvider<AuthBloc>(bloc: AuthBloc()),
        BlocProvider<PrefBloc>(bloc: PrefBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: appTheme(),
        initialRoute: '/',
        routes: routes,
      ),

//      home: OnBoardingPage(),
    );
  }
}

