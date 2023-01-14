import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:elagk_pharmacy/core/local/cache_helper.dart';
import 'package:elagk_pharmacy/core/network/api_constants.dart';
import 'package:elagk_pharmacy/core/utils/app_constants.dart';
import 'package:elagk_pharmacy/drawer/presentation/controller/pharmacy_user_profile_controller/pharmacy_profile_bloc.dart';
import 'package:elagk_pharmacy/home/data/models/accepted_model.dart';
import 'package:elagk_pharmacy/home/data/models/orders/userModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitialState());

  static OrderCubit get(context) => BlocProvider.of(context);


  List deliveries=[];

  Future<void> getDeliveries()
  async {
    emit(GetDeliveriesLoadingState());

    Dio().get(
      ApiConstants.getDeliveries(CacheHelper.getData(key: AppConstants.pharmacyId))

    ).then((value) {
      deliveries=value.data;
      print(deliveries);
      emit(GetDeliveriesSuccessState());

    }).catchError((onError) {
      emit(GetDeliveriesErrorState(onError.toString()));
      print(onError.toString());
    });
  }
  Future<void> postOrder({
    required orderId}) async {
    emit(PostOrderLoadingState());
    Dio().patch(
      ApiConstants.postOrder(orderId),

    ).then((value) {
      emit(PostOrderSuccessState());
      deliveries.forEach((element) {
        print(element);
        postNotification(
            UserID: element,
            notifiactionTitle: "New Order",
            notifiactionDescription:  'you have new order hurry up to deliver it');
      });
    }).catchError((onError) {
      emit(PostOrderErrorState(onError.toString()));
      print(onError.toString());
    });
  }


  Future<void> postDeclineOrder({
    required orderId}) async {
    emit(PostDeclineOrderLoadingState());
    Dio().patch(
      ApiConstants.postDeclineOrder(orderId),

    ).then((value) {
      emit(PostDeclineOrderSuccessState());

    }).catchError((onError) {
      emit(PostDeclineOrderErrorState(onError.toString()));
      print(onError.toString());
    });
  }


  Future<void> postNotification(
      {
        required String UserID,
        required String notifiactionTitle,
        required  String notifiactionDescription
      })
  async {
    emit(PostNotificationLoadingState());
    print(UserID);
    Dio().post('http://freeserver23-001-site1.atempurl.com/api/Notifications',
        data:{
          // "notifiactionId": 0,
          "notifiactionTitle":notifiactionTitle ,
          "notifiactionDescription":notifiactionDescription,
          "userId": "${UserID}",
          "action": "string",
          "table": "string",
          "data": "string",
        }
    ).then((value)
    {
      emit(PostNotificationSuccessState());

    }).catchError((onError)
    {
      print(onError.toString());
      emit(PostNotificationErrorState(onError.toString()));
    });

  }

  //follow

  StepperFollowModel? acceptedModel;

  Future<void> folowOrders({required int orderId}) async {
    emit(FollowOrderLoadingState());
    print('jjjjjjjjjjjjjj');
    print(orderId.toString());
    Dio().get(
        ApiConstants.followOrder(orderId))
        .then((value) {
      acceptedModel = StepperFollowModel.fromJson(value.data);
      print('jjjjjjjjjjjjjj');
      print(acceptedModel!.isAcceptedByDelivery!);
      emit(FollowOrderSuccessState());
    }).catchError((oError) {
      print(oError.toString());
      emit(FollowOrderErrorState(oError.toString()));
    });
  }


  //follow

  UserModel? user;

  Future<void> getUserData({required String userID}) async {
    emit(GetUserDataLoadingState());
    print(userID);
    await Dio().get('http://freeserver23-001-site1.atempurl.com/api/Users/$userID')
        .then((value) {
      user = UserModel.fromJson(value.data);
      emit(GetUserDataSuccessState());
    }).catchError((oError) {
      print(oError.toString());
      emit(GetUserDataErrorState(oError.toString()));
    });
  }







}
