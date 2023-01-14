
import 'package:elagk_pharmacy/core/global/app_colors.dart';
import 'package:elagk_pharmacy/core/utils/app_strings.dart';
import 'package:elagk_pharmacy/core/utils/app_values.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    Key? key,
    required this.onTap,
    required this.orderNumber,
    required this.orderTime,
  }) : super(key: key);

  final VoidCallback onTap;
  final String orderNumber;
  final String orderTime;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:

        [

          Padding(
              padding: const EdgeInsets.all(AppPadding.p5),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(AppSize.s10),
                ),
                child: Padding(
                    padding: const EdgeInsets.all(AppPadding.p10),
                    child: Row(
                      children: [
                        Container(
                            width: AppSize.s35,
                            height: AppSize.s35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(AppSize.s5),
                              color: AppColors.yellow,
                            ),
                            child: const Icon(
                              Icons.notifications_none,
                              color: Colors.white,
                            )),
                        SizedBox(width: mediaQueryWidth(context) / AppSize.s50),
                        Text(
                          "${AppStrings.orderArrived}$orderNumber",
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        const Spacer(),
                        Text(

                          DateFormat("hh:mm a").format(
                            DateTime.parse(orderTime),),
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ],
                    )),
              )),
        ],
      ),
    );
  }
}
