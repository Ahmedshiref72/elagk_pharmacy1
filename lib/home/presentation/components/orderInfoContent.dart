import 'package:dotted_line/dotted_line.dart';
import 'package:elagk_pharmacy/core/global/app_colors.dart';
import 'package:elagk_pharmacy/core/utils/app_assets.dart';
import 'package:elagk_pharmacy/core/utils/app_routes.dart';
import 'package:elagk_pharmacy/core/utils/app_strings.dart';
import 'package:elagk_pharmacy/core/utils/app_values.dart';
import 'package:elagk_pharmacy/core/utils/navigation.dart';
import 'package:elagk_pharmacy/home/data/models/orders_model.dart';
import 'package:elagk_pharmacy/home/presentation/components/alert_dialoge.dart';
import 'package:elagk_pharmacy/home/presentation/components/salary_widget.dart';
import 'package:elagk_pharmacy/home/presentation/components/scound_button.dart';
import 'package:elagk_pharmacy/home/presentation/controller/order_controller/order_cubit.dart';
import 'package:elagk_pharmacy/home/presentation/controller/order_controller/order_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import 'info_content_widget2.dart';
import 'informations_content_widget.dart';
import 'orders_components/orderBasketContent.dart';
import 'orders_components/orders_phone_container_widget.dart';

class OrderInformationContent extends StatelessWidget {
  OrderInformationContent({
    Key? key,
    this.Order,
  }) : super(key: key);
  final OrdersModel? Order;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderCubit,OrderState>(
      listener: (context,state){
        if (state is PostOrderSuccessState) {
          showDialog(
              context: context,
              builder: (_) {
                return alertDialog(
                  imageSrc: JsonAssets.orderAccepted,
                  text:
                  'تم قبول الطلب بنجاح',
                );
              });

        } else if (state is PostOrderErrorState) {
          // showToast(text: '${state.error}', state: ToastStates.ERROR);
        }
      },
      builder: (context,state){
        if(OrderCubit.get(context).acceptedModel!=null) {
          return Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //deliver to
                InformationContentSection2(
                  ontap: () async {
                    String googleUrl =
                        'https://www.google.com/maps/search/?api=1&query='
                        '${Order!.destinationLatitude},${Order!.destinationLongitude}';
                    await launch(googleUrl);
                  },
                  text: AppStrings.deliverTo,

                  text1: Order!.address.toString(),
                  child: const Icon(
                    Icons.location_on_outlined,
                    color: Colors.green,
                    size: 30,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                //pharmacy name
                const SizedBox(
                  height: 20,
                ),
                // client name
                OrderCubit.get(context).user! != null?

                InformationContentSection(
                  text: AppStrings.clientName,
                  image: 'assets/images/login/boss(1).png',
                  text1: OrderCubit.get(context).user!.firstName.toString() +
                      OrderCubit.get(context).user!.lastName.toString(),
                ):
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                //phone number
                OrderCubit.get(context).user! != null?
                InkWell(
                  onTap: (){
                    launch("tel:${  OrderCubit.get(context).user!.userPhones!.last}");
                  },
                  child: InformationContentSection(
                    text: AppStrings.phoneNumber,
                    image:  ImageAssets.call,
                    text1:   OrderCubit.get(context).user!.userPhones!.last.toString(),
                  ),
                ):
                const SizedBox(
                  height: 20,
                ),
                //carts
                ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return OrderInBasketContent(
                      categoriesName: Order!.cartViews![index].productName.toString(),
                      imageSrc: Order!.cartViews![index].imageUrl.toString(),
                      price: Order!.cartViews![index].price!.toDouble(),
                      quantity: Order!.cartViews![index].quantity.toString(),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(),
                  itemCount: Order!.cartViews!.length,
                ),
                const SizedBox(
                  height: 20,
                ),
                SalarySection(text:Order!.totalPrice!.toString(), text1:  "السعر",color: Colors.black,),
                SizedBox(height: mediaQueryHeight(context) / AppSize.s50),
                SalarySection(text: Order!.fees.toString(), text1: "الديلفري",color: Colors.black,),

                SizedBox(height: mediaQueryHeight(context) / AppSize.s50),
                const DottedLine(
                    dashColor: Colors.grey, dashLength: 11, dashGapLength: 10),
                SizedBox(height: mediaQueryHeight(context) / AppSize.s50),
                SalarySection(text:Order!.totalPrice!.toString(), text1: "اجمالي السعر",color: Colors.green,),

                SizedBox(height: mediaQueryHeight(context) / AppSize.s40),
                Padding(
                  padding: const EdgeInsets.only(right: AppSize.s40),
                  child: (!OrderCubit.get(context)
                      .acceptedModel!
                      .isAcceptedByPharmacy!)
                      ? Row(
                    children: [
                      ScoundButton(
                        onPressed: () {
                          OrderCubit.get(context).folowOrders(
                              orderId: Order!.orderId!.toInt());
                          OrderCubit.get(context).postOrder(
                              orderId: Order!.orderId!.toInt());
                          //post notify to client
                          OrderCubit.get(context).postNotification(UserID:
                          Order!.userId!, notifiactionTitle: "order Progress",
                              notifiactionDescription:
                              "your order Accepted successfully from pharmacy");

                          //post notify to delevery
                          // OrderCubit.get(context).postNotification(UserID:);
                        },
                        mainColor: Colors.green,
                        scoundColor: Colors.green.shade50,
                        text: 'قبول',
                      ),
                      SizedBox(
                          width: mediaQueryWidth(context) / AppSize.s5),
                      ScoundButton(
                        onPressed: ()  {
                          OrderCubit.get(context).folowOrders(
                              orderId: Order!.orderId!.toInt());
                          OrderCubit.get(context).postDeclineOrder(
                              orderId: Order!.orderId!.toInt());
                          //post notify to client
                          OrderCubit.get(context).postNotification(
                              UserID:
                          Order!.userId!, notifiactionTitle: "order Progress",
                              notifiactionDescription:
                              "your order Declined from pharmacy");

                          navigateFinalTo(context: context, screenRoute: Routes.homeDrawerScreen);
                          //post notify to delevery
                          // OrderCubit.get(context).postNotification(UserID:);
                        },
                        mainColor: Colors.red,
                        scoundColor: Colors.red.shade50,
                        text: 'رفض',
                      ),
                    ],
                  )
                      :(state is FollowOrderLoadingState)?
                  const Center(child: CircularProgressIndicator(color: AppColors.primary,),):
                  const SizedBox(),
                )

              ],
            ),
          ),
        );
        } else {
          return const Center(child:
           CircularProgressIndicator(color: AppColors.primary,),);
        }

      },

    );
  }
}
