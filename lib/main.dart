import 'package:dsapp/services/connection-status-singleton.dart';
import 'package:dsapp/utils/common-constants.dart';
import 'package:dsapp/utils/routes.dart';
import 'package:dsapp/utils/style.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

// import 'package:intl/intl.dart';

import 'generated/l10n.dart';
//import 'package:flutter/foundation.dart' show kDebugMode;
import 'locator.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ConnectionStatusSingleton connectionStatus =
      ConnectionStatusSingleton.getInstance();
  connectionStatus.initialize();
  await Firebase.initializeApp();
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  setupLocator();
  CommonConstants.getData();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  Future<dynamic> navigateTo(String routeName, arguments) {
    return navigatorKey.currentState.pushNamed(routeName, arguments: arguments);
  }

  @override
  Widget build(BuildContext context) {
    // S.load(Locale(Intl.getCurrentLocale()));
    return MaterialApp(
      navigatorKey: navigatorKey,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      onGenerateTitle: (BuildContext context) => S.of(context).flutterDemo,
      theme: appTheme(),
      initialRoute: '/',
      routes: routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
