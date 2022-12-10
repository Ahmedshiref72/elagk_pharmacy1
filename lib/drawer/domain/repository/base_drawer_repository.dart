import 'package:dartz/dartz.dart';
import 'package:elagk_pharmacy/core/error/failure.dart';
import 'package:elagk_pharmacy/drawer/domain/entities/about_us_entity.dart';
import 'package:elagk_pharmacy/drawer/domain/entities/category_entity.dart';
import 'package:elagk_pharmacy/drawer/domain/entities/contact_us_entity.dart';
import 'package:elagk_pharmacy/drawer/domain/entities/medicine_entity.dart';
import 'package:elagk_pharmacy/drawer/domain/entities/pharmacy_user_entity.dart';
import 'package:elagk_pharmacy/drawer/domain/usecases/add_medicine_usecase.dart';
import 'package:elagk_pharmacy/drawer/domain/usecases/delete_medicine_usecase.dart';
import 'package:elagk_pharmacy/drawer/domain/usecases/get_about_us_first_usecase.dart';
import 'package:elagk_pharmacy/drawer/domain/usecases/get_about_us_second_usecase.dart';
import 'package:elagk_pharmacy/drawer/domain/usecases/get_medicine_usecase.dart';
import 'package:elagk_pharmacy/drawer/domain/usecases/get_medicines_usecase.dart';
import 'package:elagk_pharmacy/drawer/domain/usecases/get_pharmacy_user_profile_usecase.dart';
import 'package:elagk_pharmacy/drawer/domain/usecases/send_complaint_usecase.dart';
import 'package:elagk_pharmacy/drawer/domain/usecases/update_medicine_usecase.dart';

// Contract Class
abstract class BaseDrawerRepository {
  // About us screen
  Future<Either<Failure, AboutUsFirst>> getAboutUsFirst(GetAboutUsFirstParameters parameters);
  Future<Either<Failure, AboutUsSecond>> getAboutUsSecond(GetAboutUsSecondParameters parameters);

  // Contact us screen
  Future<Either<Failure, ContactUs>> getContactUs();


  // Add medicines screen
  Future<Either<Failure, Medicine>> addMedicine(
      AddMedicineParameters parameters);

  // Pharmacy user profile screen
  Future<Either<Failure, Medicine>> getMedicine(GetMedicineParameters parameters);
  Future<Either<Failure, List<Medicine>>> getMedicines(GetMedicinesParameters parameters);

  Future<Either<Failure, Medicine>> updateMedicine(UpdateMedicineParameters parameters);

  Future<Either<Failure, void>> deleteMedicine(DeleteMedicineParameters parameters);
  Future<Either<Failure, PharmacyUser>> getPharmacyUserProfile(GetPharmacyUserParameters parameters);
  Future<Either<Failure, List<Category>>> getCategories();

  // Complaints screen
  Future<Either<Failure, void>> sendComplaint(SendComplaintParameters parameters);
}
