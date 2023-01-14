import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elagk_pharmacy/core/local/cache_helper.dart';
import 'package:elagk_pharmacy/core/network/api_constants.dart';
import 'package:elagk_pharmacy/core/utils/app_constants.dart';
import 'package:elagk_pharmacy/home/data/models/prescription_model.dart';
import 'package:elagk_pharmacy/home/presentation/controller/home_screen_controller/home_screen_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/orders_model.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(HomeScreenInitialState());

  static HomeScreenCubit get(context) => BlocProvider.of(context);

//orders
  List<OrdersModel> Orders = [];


  Future<void> getOrders() async {
    Orders = [];

    emit(GetOrdersLoadingState());
// print(CacheHelper
//     .getData(key: AppConstants.pharmacyId));
    try {
      Response response = await Dio().get(ApiConstants.getpharmacyOrdersById(
        CacheHelper.getData(key:AppConstants.pharmacyId)

      ) );
      Orders = (response.data as List)
          .map((x) => OrdersModel.fromJson(x))
          .toList();
      Orders=Orders.reversed.toList();
      print(CacheHelper.getData(key: AppConstants.userId));
      print(Orders.length);
     // print(carts.length);
      emit(GetOrdersSuccessState(Orders));
      getPrescriptions();
    } catch (error, stacktrace) {
      emit(GetOrdersErrorState(error.toString()));

      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

List<PrescriptionModel> prescriptions=[];
  Future<void> getPrescriptions() async {
    prescriptions = [];

    emit(GetPrescriptionsLoadingState());

    try {
      Response response = await Dio().get(ApiConstants.getpharmacyPrescriptionsById(
          CacheHelper.getData(key:AppConstants.pharmacyId)

      ) );
      prescriptions = (response.data as List)
          .map((x) => PrescriptionModel.fromJson(x))
          .toList();
      prescriptions=prescriptions.reversed.toList();
      print(CacheHelper.getData(key: AppConstants.userId));
      print(prescriptions.length);
      print('ordersLength${Orders.length}');
      prescriptions.forEach((element) {

        Orders.add(
          OrdersModel(
            orderId:element.pharmacyId,
            distance:0,
            destinationLatitude:0,
            destinationLongitude:0,
            address:'tanta',
            createdAt:element.createdAt,
            updatedAt:element.updatedAt,
            totalPrice:0,
            userId:element.userId,
            pharmacyId:element.pharmacyId,
            cartViews:[
              CartViews(
                productId:element.prescriptionId,
                productName:'Prescription',
                categoryName:'Prescription',
                imageUrl:element.prescriptionImage,
                quantity:1,
                price:0)
            ]

          )

        );
      });
      print('ordersLength${Orders.length}');

      // print(carts.length);
      emit(GetPrescriptionsSuccessState(prescriptions));
    } catch (error, stacktrace) {
      emit(GetPrescriptionsErrorState(error.toString()));

      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

}
