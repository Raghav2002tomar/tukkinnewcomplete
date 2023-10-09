import 'dart:convert';

import 'package:Tukki/firebase_options.dart';
import 'package:Tukki/helper/RoutesHelper.dart';
import 'package:Tukki/utils/DarkMode.dart';
import 'package:Tukki/utils/LocalStirng.dart';
import 'package:Tukki/view/homePage/inbox/ConversationScreen.dart';
import 'package:Tukki/view/homePage/inbox/InboxScreen.dart';
import 'package:Tukki/view/search/AdvanceSearchScreen.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'controller/GeneralController.dart';
import 'helper/get_di.dart' as di;
import 'model/Getmessagemodel.dart';
import 'model/PostDatamodel.dart';
import 'package:multi_language_json/multi_language_json.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await setupFlutterNotifications();
  // showFlutterNotification(message);
  if(generalController.msgUpdater!=null){
    generalController.msgUpdater.value=true;
  }
}

late AndroidNotificationChannel channel;

bool isFlutterLocalNotificationsInitialized = false;

Future<void> setupFlutterNotifications() async {
  if (isFlutterLocalNotificationsInitialized) {

    return;
  }
  channel = const AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    description: 'This channel is used for important notifications.',
    importance: Importance.high,
  );

  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(alert: true, badge: true, sound: true,);
  isFlutterLocalNotificationsInitialized = true;
}

void showFlutterNotification(RemoteMessage message) {
  RemoteNotification? notification = message.notification;
  AndroidNotification? android = message.notification?.android;
  if (notification != null && android != null && !kIsWeb) {
    flutterLocalNotificationsPlugin.show(
      notification.hashCode,
      notification.title,
      notification.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          channelDescription: channel.description,
          icon: 'launch_background',
        ),
      ),
    );
  }
}

late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await GetStorage().initStorage;
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FirebaseMessaging.instance.requestPermission(sound: true,alert: true);
  FirebaseMessaging.onMessage.listen((event) {
    print(event.notification!.title!);
    print(event.notification!.body!);
    if(generalController.msgUpdater!=null){
    generalController.msgUpdater.value=true;
  }
  
    if(isChatOpen==true || isInboxOpen==true){

    }else{
      showFlutterNotification(event);
    }
  });
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  if (!kIsWeb) {
    await setupFlutterNotifications();
  }

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ColorNotifire(),
        ),
      ],
      child: GetMaterialApp(
        builder:BotToastInit(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primarySwatch: Colors.blue, fontFamily: "Gilroy",),
          translations: LocaleString(),

          // locale: const Locale('en_US', 'en_US'),
          getPages: getPages,
          initialRoute: Routes.initial,
          fallbackLocale: const Locale('en_us', 'en_us'),
          //  supportedLocales: [const Locale('en', 'US'), const Locale('ar_SA')]
           
          ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        
        //  home: InitialScreen()
        );
  }
}
