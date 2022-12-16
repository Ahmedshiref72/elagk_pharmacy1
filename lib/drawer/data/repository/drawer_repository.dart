import 'package:dartz/dartz.dart';
import 'package:elagk_pharmacy/core/error/exceptions.dart';
import 'package:elagk_pharmacy/core/error/failure.dart';
import 'package:elagk_pharmacy/drawer/data/datasource/drawer_remote_datasource.dart';
import 'package:elagk_pharmacy/drawer/domain/entities/about_us_entity.dart';
import 'package:elagk_pharmacy/drawer/domain/entities/category_entity.dart';
import 'package:elagk_pharmacy/drawer/domain/entities/contact_us_entity.dart';
import 'package:elagk_pharmacy/drawer/domain/entities/medicine_entity.dart';
import 'package:elagk_pharmacy/drawer/domain/entities/pharmacy_user_entity.dart';
import 'package:elagk_pharmacy/drawer/domain/repository/base_drawer_repository.dart';
import 'package:elagk_pharmacy/drawer/domain/usecases/add_medicine_usecase.dart';
import 'package:elagk_pharmacy/drawer/domain/usecases/delete_medicine_usecase.dart';
import 'package:elagk_pharmacy/drawer/domain/usecases/get_about_us_first_usecase.dart';
import 'package:elagk_pharmacy/drawer/domain/usecases/get_about_us_second_usecase.dart';
import 'package:elagk_pharmacy/drawer/domain/usecases/get_medicine_usecase.dart';
import 'package:elagk_pharmacy/drawer/domain/usecases/get_medicines_usecase.dart';
import 'package:elagk_pharmacy/drawer/domain/usecases/get_pharmacy_user_profile_usecase.dart';
import 'package:elagk_pharmacy/drawer/domain/usecases/send_complaint_usecase.dart';
import 'package:elagk_pharmacy/drawer/domain/usecases/update_medicine_usecase.dart';

// Concrete or Implementation class.
class DrawerRepository extends BaseDrawerRepository {
  final BaseDrawerRemoteDataSource baseDrawerRemoteDataSource;

  DrawerRepository(this.baseDrawerRemoteDataSource);

  // Contact us screen
  @override
  Future<Either<Failure, ContactUs>> getContactUs() async {
    try {
      final result = await baseDrawerRemoteDataSource.getContactUs();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  // About us screen
  @override
  Future<Either<Failure, AboutUsFirst>> getAboutUsFirst(
      GetAboutUsFirstParameters parameters) async {
    try {
      final result =
          await baseDrawerRemoteDataSource.getAboutUsFirst(parameters);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, AboutUsSecond>> getAboutUsSecond(
      GetAboutUsSecondParameters parameters) async {
    try {
      final result =
          await baseDrawerRemoteDataSource.getAboutUsSecond(parameters);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  // Add medicines screen
  @override
  Future<Either<Failure, Medicine>> addMedicine(
      AddMedicineParameters parameters) async {
    try {
      final result = await baseDrawerRemoteDataSource.addMedicine(parameters);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  // Pharmacy user profile screen
  @override
  Future<Either<Failure, Medicine>> getMedicine(
      GetMedicineParameters parameters) async {
    try {
      final result = await baseDrawerRemoteDataSource.getMedicine(parameters);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Medicine>>> getMedicines(
      GetMedicinesParameters parameters) async {
    try {
      final result = await baseDrawerRemoteDataSource.getMedicines(parameters);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, Medicine>> updateMedicine(
      UpdateMedicineParameters parameters) async {
    try {
      final result =
          await baseDrawerRemoteDataSource.updateMedicine(parameters);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, void>> deleteMedicine(
      DeleteMedicineParameters parameters) async {
    try {
      final result =
          await baseDrawerRemoteDataSource.deleteMedicine(parameters);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, PharmacyUser>> getPharmacyUserProfile(
      GetPharmacyUserParameters parameters) async {
    try {
      final result =
          await baseDrawerRemoteDataSource.getPharmacyUserProfile(parameters);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Category>>> getCategories() async {
    try {
      final result = await baseDrawerRemoteDataSource.getCategories();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  // Complaints screen
  @override
  Future<Either<Failure, void>> sendComplaint(
      SendComplaintParameters parameters) async {
    try {
      final result = await baseDrawerRemoteDataSource.sendComplaint(parameters);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
