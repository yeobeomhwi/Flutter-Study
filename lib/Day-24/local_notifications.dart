import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 타임존 데이터 초기화
  tz.initializeTimeZones();
  tz.setLocalLocation(tz.getLocation('Asia/Seoul'));

  // 안드로이드와 iOS 알림 초기화 설정
  const AndroidInitializationSettings androidInitializationSettings =
  AndroidInitializationSettings('@mipmap/ic_launcher');

  const DarwinInitializationSettings darwinInitializationSettings = DarwinInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
  );

  const InitializationSettings initializationSettings = InitializationSettings(
    android: androidInitializationSettings,
    iOS: darwinInitializationSettings,
  );

  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
  );

  // Android용 알림 채널 생성
  const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'test_channel123',
    'test_channel123',
    description: '테스트 채널 입니다',
    importance: Importance.max,
  );

  final AndroidFlutterLocalNotificationsPlugin? androidFlutterLocalNotificationsPlugin =
  flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
  if (androidFlutterLocalNotificationsPlugin != null) {
    await androidFlutterLocalNotificationsPlugin.createNotificationChannel(channel);
  }

  runApp(MyApp());
}

// 알림 클릭시 호출되는 함수
void onDidReceiveNotificationResponse(NotificationResponse notificationResponse) {
  if (notificationResponse.payload != null) {
    print('알림 클릭 시 payload: ${notificationResponse.payload}');
  }
}

class MyApp extends StatelessWidget {
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
              onPressed: () => showImmediateNotification(),
              child: Text('즉시 알림 보내기'),
            ),
          ],
        ),
      ),
    );
  }

  // 즉시 알림 보내기 함수
  Future<void> showImmediateNotification() async {
    const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
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
