import '../../../data/models/orders_model.dart';

abstract class OrderState {}

class OrderInitialState extends OrderState {}

class PostOrderLoadingState  extends OrderState {}
class PostOrderSuccessState  extends OrderState {}
class PostOrderErrorState  extends OrderState
{
  final String error;

  PostOrderErrorState(this.error);
}


class PostDeclineOrderLoadingState  extends OrderState {}
class PostDeclineOrderSuccessState  extends OrderState {}
class PostDeclineOrderErrorState  extends OrderState
{
  final String error;

  PostDeclineOrderErrorState(this.error);
}

//follow
class FollowOrderLoadingState  extends OrderState {}
class FollowOrderSuccessState  extends OrderState {}
class FollowOrderErrorState  extends OrderState
{
  final String error;

  FollowOrderErrorState(this.error);
}




//notify
class PostNotificationLoadingState  extends OrderState {}
class PostNotificationSuccessState  extends OrderState {}
class PostNotificationErrorState  extends OrderState
{
  final String error;

  PostNotificationErrorState(this.error);
}



//notify
class GetDeliveriesLoadingState  extends OrderState {}
class GetDeliveriesSuccessState  extends OrderState {}
class GetDeliveriesErrorState  extends OrderState
{
  final String error;

  GetDeliveriesErrorState(this.error);
}


//userData

//follow
class GetUserDataLoadingState  extends OrderState {}
class GetUserDataSuccessState  extends OrderState {}
class GetUserDataErrorState  extends OrderState
{
  final String error;

  GetUserDataErrorState(this.error);
}