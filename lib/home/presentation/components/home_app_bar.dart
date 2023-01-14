
import 'package:elagk_pharmacy/core/global/app_colors.dart';
import 'package:elagk_pharmacy/core/local/cache_helper.dart';
import 'package:elagk_pharmacy/core/utils/app_constants.dart';
import 'package:elagk_pharmacy/core/utils/app_values.dart';
import 'package:elagk_pharmacy/home/presentation/controller/home_screen_controller/home_screen_cubit.dart';
import 'package:elagk_pharmacy/home/presentation/controller/home_screen_controller/home_screen_state.dart';
import 'package:elagk_pharmacy/notification/controller/notification_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'menu_widget_component.dart';

PreferredSizeWidget homePageAppBar(
    BuildContext context, {
      required Widget title,
      required Function()? onTap,
      required Widget actionWidget,
    }) =>
    AppBar(
      toolbarHeight:mediaQueryHeight(context)*.077 ,
      iconTheme: const IconThemeData(color: Colors.black),
      title: title,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: AppSize.s0,
      automaticallyImplyLeading: true,
      actions: [
        Padding(
          padding: const EdgeInsets.all(AppPadding.p5),
          child: InkWell(
            onTap: CacheHelper.getData(key: AppConstants.token) == null
                ? () {
              // TODO.
              /*navigateTo(
                      context: context,
                      screenRoute: Routes.makeLoginScreen,
                      arguments: const MakeLoginScreenArguments(title: 'الشراء'),
                    );*/
            } : onTap,
            child: Stack(
               children: [
                 Container(
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
                   child: Center(child: actionWidget),
                 ),
               ],
            ),
          ),
        ),
      ],
      leading:  const MenuWidget(), // TODO.
    );
