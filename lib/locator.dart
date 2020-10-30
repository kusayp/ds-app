
import 'package:dsapp/main.dart';
import 'package:get_it/get_it.dart';

import 'package:dsapp/services/push_notification_service.dart';


GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => PushNotificationService());
  locator.registerLazySingleton(() => MyApp());
}


