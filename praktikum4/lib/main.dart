import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'screen/detail_screen.dart';
import 'screen/new_screen.dart';

void main() => runApp(
  MaterialApp(
    theme: ThemeData(appBarTheme: AppBarTheme(color: Colors.amber)),
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ),
);

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    var initializationSettingsAndroid = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );
    var initializationSettingsIOS = IOSInitializationSettings();
    var initSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    flutterLocalNotificationsPlugin.initialize(
      initSettings,
      onSelectNotification: onSelectNotification,
    );
  }

  Future onSelectNotification(String? payload) async {
    if (payload != null) {
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (_) => NewScreen(payload: payload)));
    }
  }

  Future<void> showNotification() async {
    var android = AndroidNotificationDetails(
      'id',
      'channel',
      'description',
      priority: Priority.high,
      importance: Importance.max,
    );
    var iOS = IOSNotificationDetails();
    var platform = NotificationDetails(android: android, iOS: iOS);

    await flutterLocalNotificationsPlugin.show(
      0,
      'Flutter Devs',
      'Flutter Local Notification Demo',
      platform,
      payload: 'Welcome to the Local Notification demo',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Flutter Notification Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(title: "Detail User"),
                  ),
                );
              },
              child: Text("Pindah ke Detail"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: showNotification,
              child: Text("Tampilkan Notifikasi"),
            ),
          ],
        ),
      ),
    );
  }
}
