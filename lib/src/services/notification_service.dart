part of 'services.dart';

class NotificationService {
  late FlutterLocalNotificationsPlugin localNotifications =
      FlutterLocalNotificationsPlugin();
  //TODO: Init Function
  void init(
      Future<dynamic> Function(int, String?, String?, String?)? onDidReceive,
      Function(NotificationResponse)? onDidReceiveNotificationResponse) {
    //TODO: Init Android
    final AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings(appIcon);

    //TODO: Init IOS
    final DarwinInitializationSettings iosSettings =
        DarwinInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
      onDidReceiveLocalNotification: onDidReceive,
    );

    //TODO: Init Setting
    final InitializationSettings initSetting =
        InitializationSettings(android: androidSettings, iOS: iosSettings);

    tz.initializeTimeZones();

    initLocalNotif(initSetting, onDidReceiveNotificationResponse);
  }

  //TODO: Init Plugin
  void initLocalNotif(InitializationSettings initSetting,
      Function(NotificationResponse)? onDidReceiveNotificcationResponse) async {
    await localNotifications.initialize(initSetting,
        onDidReceiveNotificationResponse: onDidReceiveNotificcationResponse);
  }

  //TODO: Show Notif
  void showNotif(String title, String message, String idProduct) async {
    //TODO: Android Notif Detail
    AndroidNotificationDetails androidNotifDetail =
        const AndroidNotificationDetails(channelId, 'Belajar Salt',
            playSound: true);

    DarwinNotificationDetails iosNotifDetail = DarwinNotificationDetails();

    await localNotifications.show(12345, title, message,
        NotificationDetails(android: androidNotifDetail, iOS: iosNotifDetail),
        payload: idProduct);
  }

  //TODO: Scheduled Notif birthday
  void showNotifBirthday(String title, String message, String idProduct) async {
    AndroidNotificationDetails androidNotifDetail =
        const AndroidNotificationDetails(channelId, 'Belajar Salt',
            playSound: true);

    DarwinNotificationDetails iosNotifDetail = DarwinNotificationDetails();

    await localNotifications.zonedSchedule(
        12345,
        title,
        message,
        tz.TZDateTime.now(tz.local).add(Duration(seconds: 5)),
        NotificationDetails(android: androidNotifDetail, iOS: iosNotifDetail),
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true,
        payload: idProduct);
  }

  //TODO: Cancel Notif
}
