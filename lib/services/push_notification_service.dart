import 'dart:convert';
import 'dart:io';

import 'package:dsapp/locator.dart';
import 'package:dsapp/main.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/services/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;

class PushNotificationService {
  final FirebaseMessaging _fcm = FirebaseMessaging();

  // DBServices dbServices = DBServices();
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  final String serverToken =
      'AAAAJxgM_dc:APA91bECZeEKMQPH-ghKOPRKAHGjCqLptZXdGIgP27vVspUPZQZYMzZ0flXBDDHDnd6Bo0zueKYLd3XfnRzb_iSx3IWnLX2GGJA3KJYNfhbxpgyIkpGiAKwt5eXc9Rt1vqOxn7ZcIBGU';

  Future initialise() async {
    if (Platform.isIOS) {
      // request permissions if we're on android
      _fcm.requestNotificationPermissions(IosNotificationSettings());
    }

    _fcm.configure(
      // Called when the app is in the foreground and we receive a push notification
      onMessage: (Map<String, dynamic> message) async {
        final title = message['notification']['title'] ?? '';
        final body = message['notification']['body'] ?? '';
        final data = jsonEncode(message['data']);
        print('onMessage: $message');
        showNotification2(1234, title, body, data);

        // return;
      },
      // Called when the app has been closed comlpetely and it's opened
      // from the push notification.
      onLaunch: (Map<String, dynamic> message) async {
        final title = message['notification']['title'] ?? '';
        final body = message['notification']['body'] ?? '';
        final data = jsonEncode(message['data']);
        print('onLaunch: $message');
        showNotification2(1234, title, body, data);
      },
      // Called when the app is in the background and it's opened
      // from the push notification.
      onResume: (Map<String, dynamic> message) async {
        final title = message['notification']['title'] ?? '';
        final body = message['notification']['body'] ?? '';
        final data = jsonEncode(message['data']);
        print('onResume: $message');
        showNotification2(1234, title, body, data);
      },
      onBackgroundMessage: myBackgroundMessageHandler,
    );
    initialiseLocalNotification();
  }

  Future initialiseLocalNotification() async {
    var initializationSettingsAndroid =
        new AndroidInitializationSettings('app_icon');
    var initializationSettingsIOS = new IOSInitializationSettings();
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS);
    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
  }

  Future<void> _showNotification(
    int notificationId,
    String notificationTitle,
    String notificationContent,
    String payload, {
    String channelId = '1234',
    String channelTitle = 'Android Channel',
    String channelDescription = 'Default Android Channel for notifications',
    Priority notificationPriority = Priority.high,
    Importance notificationImportance = Importance.max,
  }) async {
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
      channelId,
      channelTitle,
      channelDescription,
      playSound: false,
      importance: notificationImportance,
      priority: notificationPriority,
    );
    var iOSPlatformChannelSpecifics =
        new IOSNotificationDetails(presentSound: false);
    var platformChannelSpecifics = new NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      notificationId,
      notificationTitle,
      notificationContent,
      platformChannelSpecifics,
      payload: payload,
    );
  }

  void showNotification2(
    int notificationId,
    String notificationTitle,
    String notificationContent,
    String payload, {
    String channelId = '1234',
    String channelTitle = 'Android Channel',
    String channelDescription = 'Default Android Channel for notifications',
    Priority notificationPriority = Priority.high,
    Importance notificationImportance = Importance.max,
  }) async {
    await _showNotification(
        notificationId, notificationTitle, notificationContent, payload);
  }

  Future onSelectNotification(String payload) async {
    print('Notification selected $payload');
    Map<String, dynamic> json = jsonDecode(payload);
    _serialiseAndNavigate(json);
  }

  Future<String> getToken() async {
    return _fcm.getToken();
  }

  void _serialiseAndNavigate(Map<String, dynamic> message) async {
//    var notificationData = message['data'];
    var view = message['type'];

    if (view != null) {
      // Navigate to the create post view
      if (view == 'chat_message') {
        //Navigate to appropriate view
        UserModel user = await LoginService().getUserById(message['user']);
        locator<MyApp>().navigateTo('/conversations', user);
      }
    }
  }

  Future<void> sendAndRetrieveMessage(Map<String, dynamic> data) async {
    try {
      await http.post(
        'https://fcm.googleapis.com/fcm/send',
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'key=$serverToken',
        },
        body: jsonEncode(
          <String, dynamic>{
            'notification': <String, dynamic>{
              'body': data['message'],
              'title': data['title'],
            },
            'priority': 'high',
            'data': data,
            'to': data['token'],
          },
        ),
      );
    } on SocketException catch (_) {}
  }
}

Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) async {
  print('myBackgroundMessageHandler: $message');
  if (message.containsKey('data')) {
    // Handle data message
//    final dynamic data = message['data'];
  }

  if (message.containsKey('notification')) {
    // Handle notification message
//    final dynamic notification = message['notification'];
  }

  // Or do other work.
}
