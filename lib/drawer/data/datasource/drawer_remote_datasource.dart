import 'package:dio/dio.dart';
import 'package:elagk_pharmacy/core/error/exceptions.dart';
import 'package:elagk_pharmacy/core/local/cache_helper.dart';
import 'package:elagk_pharmacy/core/network/api_constants.dart';
import 'package:elagk_pharmacy/core/network/error_message_model.dart';
import 'package:elagk_pharmacy/core/utils/app_constants.dart';
import 'package:elagk_pharmacy/drawer/data/models/about_us_model.dart';
import 'package:elagk_pharmacy/drawer/data/models/category_model.dart';
import 'package:elagk_pharmacy/drawer/data/models/contact_us_model.dart';
import 'package:elagk_pharmacy/drawer/data/models/medicine_model.dart';
import 'package:elagk_pharmacy/drawer/data/models/pharmacy_user_model.dart';
import 'package:elagk_pharmacy/drawer/domain/usecases/add_medicine_usecase.dart';
import 'package:elagk_pharmacy/drawer/domain/usecases/delete_medicine_usecase.dart';
import 'package:elagk_pharmacy/drawer/domain/usecases/get_about_us_first_usecase.dart';
import 'package:elagk_pharmacy/drawer/domain/usecases/get_about_us_second_usecase.dart';
import 'package:elagk_pharmacy/drawer/domain/usecases/get_medicine_usecase.dart';
import 'package:elagk_pharmacy/drawer/domain/usecases/get_medicines_usecase.dart';
import 'package:elagk_pharmacy/drawer/domain/usecases/get_pharmacy_user_profile_usecase.dart';
import 'package:elagk_pharmacy/drawer/domain/usecases/send_complaint_usecase.dart';
import 'package:elagk_pharmacy/drawer/domain/usecases/update_medicine_usecase.dart';
import 'package:flutter/foundation.dart';

// Contract class.
abstract class BaseDrawerRemoteDataSource {
  // Contact us screen
  Future<ContactUsModel> getContactUs();

  // About us screen
  Future<AboutUsFirstModel> getAboutUsFirst(
      GetAboutUsFirstParameters parameters);

  Future<AboutUsSecondModel> getAboutUsSecond(
      GetAboutUsSecondParameters parameters);

  // Add medicines screen
  Future<MedicineModel> addMedicine(AddMedicineParameters parameters);

  // Pharmacy user profile screen
  Future<MedicineModel> getMedicine(GetMedicineParameters parameters);

  Future<List<MedicineModel>> getMedicines(GetMedicinesParameters parameters);

  Future<MedicineModel> updateMedicine(UpdateMedicineParameters parameters);

  Future<void> deleteMedicine(DeleteMedicineParameters parameters);

  Future<PharmacyUserModel> getPharmacyUserProfile(
      GetPharmacyUserParameters parameters);

  Future<List<CategoryModel>> getCategories();

  // Complaints screen
  Future<void> sendComplaint(SendComplaintParameters parameters);
}

// Concrete or Implementation class.
class DrawerRemoteDataSource extends BaseDrawerRemoteDataSource {
  static const Map<String, String> headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json'
  };

  Options options = Options(
    headers: headers,
    followRedirects: false,
    validateStatus: (status) {
      return status! < 500;
    },
  );

  // Contact us screen
  @override
  Future<ContactUsModel> getContactUs() async {
    final response = await Dio().get(ApiConstants.contactUs);
    // success state.
    if (response.statusCode == 200) {
      return ContactUsModel.fromJson(response.data);
      // failed state.
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  // About us screen
  @override
  Future<AboutUsFirstModel> getAboutUsFirst(
      GetAboutUsFirstParameters parameters) async {
    final response =
        await Dio().get(ApiConstants.aboutUsTypePath(parameters.whoAreWe));
    // success state.
    if (response.statusCode == 200) {
      return AboutUsFirstModel.fromJson(response.data);
      // failed state.
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<AboutUsSecondModel> getAboutUsSecond(
      GetAboutUsSecondParameters parameters) async {
    final response = await Dio().get(ApiConstants.aboutUsTypePath(parameters.vision));
    // success state.
    if (response.statusCode == 200) {
      return AboutUsSecondModel.fromJson(response.data);
      // failed state.
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  // Add medicines screen
  @override
  Future<MedicineModel> addMedicine(AddMedicineParameters parameters) async {
    Map<String, dynamic> body;
    body = {
      "UserId": parameters.userId,
      "PharmacyId": parameters.pharmacyId,
      "ProductId": parameters.productId,
      "ProductName": parameters.productName,
      "Description": parameters.productDescription,
      "Price": parameters.productPrice,
      "DiscountPercent": parameters.discountPercent,
      "Image": await MultipartFile.fromFile(
        parameters.productImage!.path,
        filename: parameters.productImage!.path.split('/').last,
      ),
      "Point": parameters.point,
      // "CategoryId": 1, // Todo: Check this in backend.
      "CategoryName": parameters.categoryName,
      "Quantity": parameters.quantity,
      "Dose": parameters.dose,
      "CreatedAt ": parameters.createdAt,
    };
    final response = await Dio().post(
      ApiConstants.products,
      // sending "FormData" to api because the body contains file/attachment.
      data: FormData.fromMap(body),
      options: options,
    );
    if (response.statusCode == 200) {
      return MedicineModel.fromJson(response.data);
    } else {
      debugPrint(response.statusMessage);
      throw ServerException(errorMessageModel: ErrorMessageModel(statusMessage: response.statusMessage!));
    }
  }

  // Pharmacy user profile screen
  @override
  Future<MedicineModel> getMedicine(GetMedicineParameters parameters) async {
    final response = await Dio().get(
      ApiConstants.productIdPath(parameters.id),
      options: options,
    );
    if (response.statusCode == 200) {
      return MedicineModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MedicineModel>> getMedicines(
      GetMedicinesParameters parameters) async {
    final response = await Dio().get(
      ApiConstants.productsByCategoryAndIDPath(
        parameters.pharmacyId,
        parameters.categoryName,
      ),
    );

    if (response.statusCode == 200) {
      return List<MedicineModel>.from(
          (response.data).map((e) => MedicineModel.fromJson(e)));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<MedicineModel> updateMedicine(
      UpdateMedicineParameters parameters) async {
    Map<String, dynamic> body;
    if(parameters.productImage != null){
      body = {
        "UserId": parameters.userId,
        "PharmacyId": parameters.pharmacyId,
        "ProductId": parameters.productId,
        "ProductName": parameters.productName,
        "Description": parameters.productDescription,
        "Price": parameters.productPrice,
        "DiscountPercent": parameters.discountPercent,
        "Image": await MultipartFile.fromFile(
          parameters.productImage!.path,
          filename: parameters.productImage!.path.split('/').last,
        ),
        "Point": parameters.point,
        // "CategoryId": 1, // Todo: Check this in backend "Optional".
        "CategoryName": parameters.categoryName,
        "Quantity": parameters.quantity,
        "Dose": parameters.dose,
        "CreatedAt ": parameters.createdAt,
      };
    }else{
      body = {
        "UserId": parameters.userId,
        "PharmacyId": parameters.pharmacyId,
        "ProductId": parameters.productId,
        "ProductName": parameters.productName,
        "Description": parameters.productDescription,
        "Price": parameters.productPrice,
        "DiscountPercent": parameters.discountPercent,
        "ImageUrl": parameters.imageUrl,
        "Point": parameters.point,
        // "CategoryId": 1, // Todo: Check this in backend "Optional".
        "CategoryName": parameters.categoryName,
        "Quantity": parameters.quantity,
        "Dose": parameters.dose,
        "CreatedAt ": parameters.createdAt,
      };
    }

    final response = await Dio().put(
      ApiConstants.productIdPath(parameters.productId),
      // sending "FormData" to api because the body contains file/attachment.
      data: FormData.fromMap(body),
      options: options,
    );
    if (response.statusCode == 200) {
      return MedicineModel.fromJson(response.data);
    } else {
      debugPrint(response.statusMessage);
      throw ServerException(
        errorMessageModel:
        ErrorMessageModel(statusMessage: response.statusMessage!),
      );
    }
  }

  @override
  Future<void> deleteMedicine(DeleteMedicineParameters parameters) async {
    final response = await Dio().delete(
      ApiConstants.productIdPath(parameters.id),
    );
    if (response.statusCode != 200) {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<PharmacyUserModel> getPharmacyUserProfile(
      GetPharmacyUserParameters parameters) async {
    final response = await Dio().get(
      ApiConstants.pharmacyUserIdPath(parameters.userId),
    );
    if (response.statusCode == 200) {
      CacheHelper.setData(
        key: AppConstants.pharmacyId,
        value: response.data[AppConstants.pharmacyId],
      );
      return PharmacyUserModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    final response = await Dio().get(ApiConstants.categories);
    if (response.statusCode == 200) {
      return List<CategoryModel>.from((response.data) // [].
          .map((e) => CategoryModel.fromJson(e))); // if {[]} "as List".
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  // Complaints screen
  @override
  Future<void> sendComplaint(SendComplaintParameters parameters) async {
    final response = await Dio().post(
      ApiConstants.complaints,
      data: parameters.toJson(),
    );
    if (response.statusCode != 200) {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
