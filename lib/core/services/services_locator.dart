import 'package:elagk_pharmacy/auth/data/datasource/base_auth_remote_datasource.dart';
import 'package:elagk_pharmacy/auth/data/repository/auth_repository.dart';
import 'package:elagk_pharmacy/auth/domain/repository/base_auth_repository.dart';
import 'package:elagk_pharmacy/auth/domain/usecases/activate_email_usecase.dart';
import 'package:elagk_pharmacy/auth/domain/usecases/forget_password_usecase.dart';
import 'package:elagk_pharmacy/auth/domain/usecases/login_usecase.dart';
import 'package:elagk_pharmacy/auth/domain/usecases/reset_password_usecase.dart';
import 'package:elagk_pharmacy/auth/domain/usecases/send_mail_usecase.dart';
import 'package:elagk_pharmacy/auth/presentation/controller/login_pharmacy_controller/login_pharmacy_bloc.dart';
import 'package:elagk_pharmacy/auth/presentation/controller/password_controller/password_bloc.dart';
import 'package:elagk_pharmacy/drawer/data/datasource/drawer_remote_datasource.dart';
import 'package:elagk_pharmacy/drawer/data/repository/drawer_repository.dart';
import 'package:elagk_pharmacy/drawer/domain/repository/base_drawer_repository.dart';
import 'package:elagk_pharmacy/drawer/domain/usecases/add_medicine_usecase.dart';
import 'package:elagk_pharmacy/drawer/domain/usecases/delete_medicine_usecase.dart';
import 'package:elagk_pharmacy/drawer/domain/usecases/get_about_us_first_usecase.dart';
import 'package:elagk_pharmacy/drawer/domain/usecases/get_about_us_second_usecase.dart';
import 'package:elagk_pharmacy/drawer/domain/usecases/get_contact_us_usecase.dart';
import 'package:elagk_pharmacy/drawer/domain/usecases/get_categories_usecase.dart';
import 'package:elagk_pharmacy/drawer/domain/usecases/get_medicine_usecase.dart';
import 'package:elagk_pharmacy/drawer/domain/usecases/get_medicines_usecase.dart';
import 'package:elagk_pharmacy/drawer/domain/usecases/get_pharmacy_user_profile_usecase.dart';
import 'package:elagk_pharmacy/drawer/domain/usecases/send_complaint_usecase.dart';
import 'package:elagk_pharmacy/drawer/domain/usecases/update_medicine_usecase.dart';
import 'package:elagk_pharmacy/drawer/presentation/controller/about_us_controller/about_us_bloc.dart';
import 'package:elagk_pharmacy/drawer/presentation/controller/categories_controller/categories_bloc.dart';
import 'package:elagk_pharmacy/drawer/presentation/controller/complaints_controller/complaints_bloc.dart';
import 'package:elagk_pharmacy/drawer/presentation/controller/medicine_controller/medicine_bloc.dart';
import 'package:elagk_pharmacy/drawer/presentation/controller/pharmacy_user_profile_controller/pharmacy_profile_bloc.dart';
import 'package:get_it/get_it.dart';

// sl = Service Locator object.
final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    // Blocs
    // Drawer blocs
    sl.registerFactory<AboutUsBloc>(() => AboutUsBloc(sl(),sl(),sl()));
    sl.registerFactory<MedicineBloc>(() => MedicineBloc(sl(),sl(),sl(),sl()));
    sl.registerFactory<PharmacyProfileBloc>(() => PharmacyProfileBloc(sl()));
    sl.registerFactory<CategoriesBloc>(() => CategoriesBloc(sl(),sl()));
    sl.registerFactory<ComplaintsBloc>(() => ComplaintsBloc(sl()));
    // Auth blocs
    sl.registerFactory<LoginPharmacyBloc>(() => LoginPharmacyBloc(sl()));
    sl.registerFactory<PasswordBloc>(() => PasswordBloc(sl(), sl(), sl(), sl()));

    // Use cases
    // Drawer use cases
    sl.registerLazySingleton<GetContactUsUseCase>(() => GetContactUsUseCase(sl()));
    sl.registerLazySingleton<GetAboutUsFirstUseCase>(() => GetAboutUsFirstUseCase(sl()));
    sl.registerLazySingleton<GetAboutUsSecondUseCase>(() => GetAboutUsSecondUseCase(sl()));
    sl.registerLazySingleton<AddMedicineUseCase>(
        () => AddMedicineUseCase(sl()));
    sl.registerLazySingleton<DeleteMedicineUseCase>(
        () => DeleteMedicineUseCase(sl()));
    sl.registerLazySingleton<UpdateMedicineUseCase>(
        () => UpdateMedicineUseCase(sl()));
    sl.registerLazySingleton<GetMedicineUseCase>(() => GetMedicineUseCase(sl()));
    sl.registerLazySingleton<GetMedicinesUseCase>(() => GetMedicinesUseCase(sl()));
    sl.registerLazySingleton<GetPharmacyUserProfileUseCase>(() => GetPharmacyUserProfileUseCase(sl()));
    sl.registerLazySingleton<GetCategoriesUseCase>(() => GetCategoriesUseCase(sl()));
    sl.registerLazySingleton<SendComplaintUseCase>(() => SendComplaintUseCase(sl()));
    // Auth use cases
    sl.registerLazySingleton<LoginUseCase>(() => LoginUseCase(sl()));
    sl.registerLazySingleton<ForgetPasswordUseCase>(
        () => ForgetPasswordUseCase(sl()));
    sl.registerLazySingleton<ActivateEmailUseCase>(
        () => ActivateEmailUseCase(sl()));
    sl.registerLazySingleton<SendMailUseCase>(() => SendMailUseCase(sl()));
    sl.registerLazySingleton<ResetPasswordUseCase>(
        () => ResetPasswordUseCase(sl()));

    // Repository
    sl.registerLazySingleton<BaseDrawerRepository>(
        () => DrawerRepository(sl()));
    sl.registerLazySingleton<BaseAuthRepository>(() => AuthRepository(sl()));

    // Data Source
    sl.registerLazySingleton<BaseDrawerRemoteDataSource>(
        () => DrawerRemoteDataSource());
    sl.registerLazySingleton<BaseAuthRemoteDataSource>(
        () => AuthRemoteDataSource());
  }
}
