
import 'package:elagk_pharmacy/core/global/app_colors.dart';
import 'package:elagk_pharmacy/core/utils/app_values.dart';
import 'package:elagk_pharmacy/home/presentation/controller/home_screen_controller/home_screen_cubit.dart';
import 'package:elagk_pharmacy/home/presentation/controller/home_screen_controller/home_screen_state.dart';
import 'package:elagk_pharmacy/notification/controller/notification_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AppBarIcon extends StatelessWidget {
  const AppBarIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenCubit, HomeScreenState>(
      builder: (context, state) {
        return Stack(
          children: [
            Container(
              child: Icon(Icons.notifications_none_outlined),
              width: AppSize.s50,
              height: AppSize.s50,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: AppColors.offWhite,
                  width: AppSize.s1,
                ),
                borderRadius: BorderRadius.circular(AppSize.s15),
              ),
            ),
            Positioned(
              bottom:AppSize.s25,
              left: AppSize.s5,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.red,
                ),
                width: AppSize.s16,
                height: AppSize.s16,
                child: Center(
                  child: Text('${NotificationCubit
                      .get(context)
                      .notifications
                      .length}', style: TextStyle(
                    fontSize: 9,

                  ),),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
