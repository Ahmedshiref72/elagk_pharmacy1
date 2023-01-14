import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:elagk_pharmacy/core/config/noti.dart';
import 'package:elagk_pharmacy/core/local/cache_helper.dart';
import 'package:elagk_pharmacy/core/network/api_constants.dart';
import 'package:elagk_pharmacy/core/utils/app_constants.dart';
import 'package:elagk_pharmacy/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/notification_model.dart';
import 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitialState());

  static NotificationCubit get(context) => BlocProvider.of(context);


  //get notification
  List<NotificationModel> notifications = [];
  NotificationModel? lastNotification;

  Timer? timer;

  Future<void> getNotifications() async {
    notifications = [];

    emit(GetNotificationLoadingState());



      try {
        Response response = await Dio().get(
            ApiConstants.getNotifications(
                CacheHelper.getData(key: AppConstants.userId)));
        notifications = (response.data as List)
            .map((x) => NotificationModel.fromJson(x))
            .toList();
        notifications=notifications.reversed.toList();
        print(notifications.length);
        print(CacheHelper.getData(key: AppConstants.userId));
        if(AppConstants.notificationLength<notifications.length) {
          lastNotification=notifications.first;
          getNotify();
        }
        AppConstants.notificationLength=notifications.length;

        emit(GetNotificationSuccessState(notifications));
      } catch (error, stacktrace) {
        emit(GetNotificationErrorState(error.toString()));

        throw Exception("Exception occured: $error stackTrace: $stacktrace");
      }

  }




void getNotify()
{

  Noti.showBigTextNotification(
      title: "${lastNotification!.notifiactionTitle}",
      body: "${lastNotification!.notifiactionDescription}",
      fln: flutterLocalNotificationsPlugin,

  );

}

void checkNotifications()
{
  timer = Timer.periodic(Duration(seconds: 35), (Timer t)=>getNotifications());

}


}
