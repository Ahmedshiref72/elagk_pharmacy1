import 'package:device_preview/device_preview.dart';
import 'package:elagk_pharmacy/auth/presentation/controller/login_pharmacy_controller/login_pharmacy_bloc.dart';
import 'package:elagk_pharmacy/auth/presentation/controller/password_controller/password_bloc.dart';
import 'package:elagk_pharmacy/core/global/app_theme.dart';
import 'package:elagk_pharmacy/core/services/services_locator.dart';
import 'package:elagk_pharmacy/core/utils/app_routes.dart';
import 'package:elagk_pharmacy/core/utils/app_strings.dart';
import 'package:elagk_pharmacy/drawer/presentation/controller/about_us_controller/about_us_bloc.dart';
import 'package:elagk_pharmacy/drawer/presentation/controller/categories_controller/categories_bloc.dart';
import 'package:elagk_pharmacy/drawer/presentation/controller/medicine_controller/medicine_bloc.dart';
import 'package:elagk_pharmacy/drawer/presentation/controller/pharmacy_user_profile_controller/pharmacy_profile_bloc.dart';
import 'package:elagk_pharmacy/home/presentation/controller/home_screen_controller/home_screen_cubit.dart';
import 'package:elagk_pharmacy/home/presentation/controller/order_controller/order_cubit.dart';
import 'package:elagk_pharmacy/notification/controller/notification_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp._internal();

  static const MyApp instance = MyApp._internal();

  factory MyApp(


      ) => instance;

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => sl<LoginPharmacyBloc>()),
        BlocProvider(create: (BuildContext context) => sl<PasswordBloc>()),
        BlocProvider(create: (BuildContext context) => sl<AboutUsBloc>()..add(const GetContactUsEvent())..add(const GetAboutUsFirstEvent())..add(const GetAboutUsSecondEvent())),
        BlocProvider(create: (BuildContext context) => sl<MedicineBloc>()),
        BlocProvider(create: (BuildContext context) => sl<PharmacyProfileBloc>()..add(const GetPharmacyUserProfileEvent())),
        BlocProvider(create: (BuildContext context) => sl<CategoriesBloc>()..add(const GetCategoriesEvent())),
        BlocProvider(create: (BuildContext context) => HomeScreenCubit()..getOrders()),
        BlocProvider(create: (BuildContext context) => OrderCubit()..getDeliveries()),
        BlocProvider(create: (BuildContext context) =>NotificationCubit()..getNotifications()..checkNotifications()),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        onGenerateRoute: RouteGenerator.getRoute,
        theme: lightTheme,
        title: AppStrings.appTitle,
      ),
    );
  }
}
