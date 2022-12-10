/*
import 'package:elagk_pharmacy/core/utils/app_routes.dart';
import 'package:elagk_pharmacy/core/utils/app_strings.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  BuildContext globalContext = Global.materialKey.currentContext!;
  Navigator.of(globalContext).pushNamed(Routes.notificationsScreen);
}

Future<void> initFCM() async {
  // foreground fcm
  FirebaseMessaging.onMessage.listen((event) {
    Fluttertoast.showToast(
      msg: AppStrings.firebaseNotification,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );
  });

// when click on notification to open app
  FirebaseMessaging.onMessageOpenedApp.listen((event) {
    BuildContext globalContext = Global.materialKey.currentContext!;
    Navigator.of(globalContext).pushNamed(Routes.notificationsScreen);
  });
}

class Global {
  static GlobalKey<NavigatorState> materialKey = GlobalKey<NavigatorState>();
}


*/
