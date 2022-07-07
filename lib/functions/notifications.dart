import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:tagyourtaxi_driver/functions/functions.dart';
import 'package:tagyourtaxi_driver/styles/styles.dart';

// create an instance
FirebaseMessaging messaging = FirebaseMessaging.instance;
FlutterLocalNotificationsPlugin fltNotification =
    FlutterLocalNotificationsPlugin();

// notification settings
// void initMessaging() {
//   var androiInit =
//       const AndroidInitializationSettings('@mipmap/ic_launcher'); //for logo
//   var iosInit = const IOSInitializationSettings(
//     defaultPresentAlert: true,
//     defaultPresentBadge: true,
//     defaultPresentSound: true,
//   );
//   var initSetting = InitializationSettings(android: androiInit, iOS: iosInit);
//   fltNotification = FlutterLocalNotificationsPlugin();
//   fltNotification.initialize(initSetting);
//   var androidDetails = const AndroidNotificationDetails(
//     '1',
//     'channelName1',
//     enableVibration: true,
//     enableLights: true,
//     importance: Importance.high,
//     playSound: true,
//     priority: Priority.high,
//     visibility: NotificationVisibility.public,
//     fullScreenIntent: true
//   );
//   var iosDetails = const IOSNotificationDetails();
//   var generalNotificationDetails =
//       NotificationDetails(android: androidDetails, iOS: iosDetails);

// }

void initMessaging(){
  AwesomeNotifications().initialize('resource://drawable/logo', [
    NotificationChannel(
          channelGroupKey: 'push_notification',
          channelKey: 'normal_push',
          channelName: 'normal_notification',
          channelDescription: 'normal notification',
          defaultColor: Colors.grey,
          ledColor: Colors.blueGrey,
          enableLights: true,
          importance: NotificationImportance.Max,
          channelShowBadge: true,
          locked: false,
          playSound: true,
          defaultPrivacy: NotificationPrivacy.Public
          ),
          NotificationChannel(
          channelGroupKey: 'trip_request',
          channelKey: 'trip_request',
          channelName: 'Trip Requests',
          channelDescription: 'Channel with Trip Request',
          defaultColor: buttonColor,
          importance: NotificationImportance.High,
          ledColor: Colors.white,
          channelShowBadge: true,
          playSound: false,
          
          locked: true,
defaultPrivacy: NotificationPrivacy.Public,
enableLights: true,

          ),

          
  ],debug: true);



    AwesomeNotifications().actionStream.listen((event) {
      if(event.buttonKeyPressed == 'accept'){
         requestAccept();
       
      }else if(event.buttonKeyPressed == 'reject'){
        requestReject();
      }
      // printWrapped(jsonDecode(jsonEncode(event.toString())));
   });

      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    if (notification != null) {
      AwesomeNotifications().createNotification(content: NotificationContent(id: 12346, channelKey: 'normal_push',
      autoDismissible: true,
      title: notification.title,
      body: notification.body,
      displayOnBackground: true,
      displayOnForeground: true,
      wakeUpScreen: true,

notificationLayout: NotificationLayout.BigText,
category: NotificationCategory.Message

      ));
          

      // if (client.connectionStatus!.state != MqttConnectionState.connected ||
      //     client.connectionStatus == null) {
      //   getUserDetails();
      //   audioPlayer.play(audio);
      // }
    }
  });

  //  AwesomeNotifications().
}