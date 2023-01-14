import 'package:elagk_pharmacy/core/global/app_colors.dart';
import 'package:elagk_pharmacy/core/utils/app_assets.dart';
import 'package:elagk_pharmacy/core/utils/app_strings.dart';
import 'package:elagk_pharmacy/home/presentation/controller/home_screen_controller/home_screen_cubit.dart';
import 'package:elagk_pharmacy/home/presentation/controller/home_screen_controller/home_screen_state.dart';
import 'package:elagk_pharmacy/notification/components/na_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'orders_components/my_devider_component.dart';
import 'orders_components/order_item_content.dart';

class OrdersContents extends StatelessWidget {
  const OrdersContents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeScreenCubit, HomeScreenState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (HomeScreenCubit.get(context).Orders.isNotEmpty ) {
          return Column(
            children: [

              Expanded(
                flex: 1,
                child: RefreshIndicator(
                  onRefresh: ()async
                  {
                    HomeScreenCubit.get(context).getOrders();
                  },
                  child: ListView.separated(
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemBuilder: (context, index) => OrderItem(
                          context: context,
                          ordersModel: HomeScreenCubit.get(context).Orders[index]),
                      separatorBuilder: (context, index) => MyDivider(),
                      itemCount: HomeScreenCubit.get(context).Orders.length),
                ),
              ),
            ],
          );
        }else if(HomeScreenCubit.get(context).Orders.isEmpty)
        {
          return Column(
            children: [
              Lottie.asset(JsonAssets.ordersDone),
              SizedBox(height: 50,),
              Center(child: NoDataWidget(AppStrings.noOrders)),
            ],
          );
        }
        else
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.primary,
            ),
          );
      },
    );
  }
}