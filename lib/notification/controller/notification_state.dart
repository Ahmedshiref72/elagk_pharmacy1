
import 'package:elagk_pharmacy/notification/data/notification_model.dart';

abstract class NotificationState {}

class NotificationInitialState extends NotificationState {}

class GetNotificationLoadingState  extends NotificationState {}
class GetNotificationSuccessState  extends NotificationState {
  final List<NotificationModel> model;

  GetNotificationSuccessState(this.model);
}
class GetNotificationErrorState  extends NotificationState
{
  final String error;

  GetNotificationErrorState(this.error);
}

