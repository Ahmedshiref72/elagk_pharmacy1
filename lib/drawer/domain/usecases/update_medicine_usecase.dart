import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:elagk_pharmacy/core/error/failure.dart';
import 'package:elagk_pharmacy/core/usecase/base_usecase.dart';
import 'package:elagk_pharmacy/drawer/domain/entities/medicine_entity.dart';
import 'package:elagk_pharmacy/drawer/domain/repository/base_drawer_repository.dart';
import 'package:equatable/equatable.dart';

class UpdateMedicineUseCase
    extends BaseUseCase<Medicine, UpdateMedicineParameters> {
  final BaseDrawerRepository baseDrawerRepository;

  UpdateMedicineUseCase(this.baseDrawerRepository);

  @override
  Future<Either<Failure, Medicine>> call(
      UpdateMedicineParameters parameters) async {
    return await baseDrawerRepository.updateMedicine(parameters);
  }
}

class UpdateMedicineParameters extends Equatable {
  final String userId;
  final int pharmacyId;
  final int productId;
  final String productName;
  final String? productDescription;
  final double? productPrice;
  final double? discountPercent;
  final File? productImage;
  final int? point;
  final int? categoryId;
  final String? categoryName;
  final int? quantity;
  final String? dose;
  final String? createdAt;

  const UpdateMedicineParameters({
    required this.userId,
    required this.pharmacyId,
    required this.productId,
    required this.productName,
    this.productDescription,
    this.productPrice,
    this.discountPercent,
    this.productImage,
    this.point,
    this.categoryId,
    this.categoryName,
    this.quantity,
    this.dose,
    this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return {
      "UserId": userId,
      "PharmacyId": pharmacyId,
      "ProductId": productId,
      "ProductName": productName,
      "Description": productDescription,
      "Price": productPrice,
      "DiscountPercent": discountPercent,
      "Image": productImage,
      "Point": point,
      "CategoryId": categoryId,
      "CategoryName": categoryName,
      "Quantity": quantity,
      "Dose": dose,
      "CreatedAt ": createdAt,
    };
  }

  @override
  List<Object?> get props => [
        userId,
        pharmacyId,
        productId,
        productName,
        productDescription,
        productPrice,
        discountPercent,
        productImage,
        point,
        categoryId,
        categoryName,
        quantity,
        dose,
        createdAt,
      ];
}
