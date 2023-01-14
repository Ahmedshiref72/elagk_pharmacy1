import 'package:elagk_pharmacy/home/data/models/prescription_model.dart';

import '../../../data/models/orders_model.dart';

abstract class HomeScreenState {}

class HomeScreenInitialState extends HomeScreenState {}

//orders
class GetOrdersLoadingState extends HomeScreenState {}
class GetOrdersSuccessState extends HomeScreenState
{
  final List<OrdersModel> model;

  GetOrdersSuccessState(this.model);
}
class GetOrdersErrorState extends HomeScreenState
{
  final String error;

  GetOrdersErrorState(this.error);
}


//orders
class GetPrescriptionsLoadingState extends HomeScreenState {}
class GetPrescriptionsSuccessState extends HomeScreenState
{
  final List<PrescriptionModel> model;

  GetPrescriptionsSuccessState(this.model);
}
class GetPrescriptionsErrorState extends HomeScreenState
{
  final String error;

  GetPrescriptionsErrorState(this.error);
}