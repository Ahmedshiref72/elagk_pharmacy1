import 'package:device_preview/device_preview.dart';
import 'package:elagk_pharmacy/core/app.dart';
import 'package:elagk_pharmacy/core/bloc_observer.dart';
import 'package:elagk_pharmacy/core/services/services_locator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/local/cache_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // await initFCM(); // TODO: enable it after adding app notifications.
  ServicesLocator().init();
  Bloc.observer = MyBlocObserver();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
      statusBarBrightness: Brightness.dark, // For iOS (dark icons)
    ),
  );
  await CacheHelper.init();
  // TODO: remove Device Preview before build apk. // from Material app too.
  runApp(DevicePreview(enabled: !kReleaseMode, builder: (context) => MyApp()));
}
