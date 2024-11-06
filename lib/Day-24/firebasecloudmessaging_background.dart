import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

// 알림 클릭시 호출되는 함수
void onDidReceiveNotificationResponse(
    NotificationResponse notificationResponse) {
  if (notificationResponse.payload != null) {
    print('알림 클릭 시 payload: ${notificationResponse.payload}');
  }
}

class Firebasecloudmessaging_background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Local Notifications',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Local Notifications 예제'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  final fcmToken =  FirebaseMessaging.instance.getToken();
                  print(fcmToken);
                },
                child: Text('토큰 체크')),
            ElevatedButton(
                onPressed: () => _requestNotificationPermission(),
                child: Text('권한 체크')),
            ElevatedButton(
              onPressed: () => showImmediateNotification(),
              child: Text('즉시 알림 보내기'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _requestNotificationPermission() async {
    await Permission.notification.request();
  }

  void checkNotiPermission(BuildContext context) async {
    var status = await Permission.notification.status;
    if (!status.isGranted) {
      openAppSettings();
    }
  }

  // 즉시 알림 보내기 함수
  Future<void> showImmediateNotification() async {
    const AndroidNotificationDetails androidDetails =
    AndroidNotificationDetails(
      'test_channel123',
      'test_channel123',
      channelDescription: '테스트',
      importance: Importance.max,
      priority: Priority.high,
    );
    const DarwinNotificationDetails iosDetails = DarwinNotificationDetails();
    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await flutterLocalNotificationsPlugin.show(
      0,
      '즉시 알림 제목',
      '즉시 알림 내용',
      notificationDetails,
      payload: '즉시 알림 페이로드',
    );
  }
}
