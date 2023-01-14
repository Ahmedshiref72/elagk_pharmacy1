import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elagk_pharmacy/core/local/cache_helper.dart';
import 'package:elagk_pharmacy/core/network/api_constants.dart';
import 'package:elagk_pharmacy/core/utils/app_constants.dart';
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
      emit(GetOrdersSuccessState(Orders));
    } catch (error, stacktrace) {
      emit(GetOrdersErrorState(error.toString()));

      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }


}
