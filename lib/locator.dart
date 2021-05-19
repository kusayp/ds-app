import 'package:dsapp/main.dart';
import 'package:dsapp/services/push_notification_service.dart';
import 'package:get_it/get_it.dart';

enum Server { MOCK, PROD }

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => PushNotificationService());
  locator.registerLazySingleton(() => MyApp());
}
