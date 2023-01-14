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