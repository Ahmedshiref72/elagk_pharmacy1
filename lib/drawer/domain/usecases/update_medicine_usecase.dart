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
  final int productId; // will send with end point to update.
  final String productName;
  final String productDescription;
  final double productPrice;
  final double discountPercent;
  final File productImage;
  final int productQuantity;
  final int point;
  final int categoryId;
  final String categoryName;
  final String createdAt;

  const UpdateMedicineParameters({
    required this.userId,
    required this.productId,
    required this.productName,
    required this.productDescription,
    required this.productPrice,
    required this.discountPercent,
    required this.productImage,
    required this.productQuantity,
    required this.point,
    required this.categoryId,
    required this.categoryName,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return {
      "UserId": userId,
      "ProductId": productId,
      "ProductName ": productName,
      "Description": productDescription,
      "Price": productPrice,
      "DiscountPercent": discountPercent,
      "Image": productImage,
      "Quantity": productQuantity,
      "Point": point,
      "CategoryId": categoryId,
      "CategoryName": categoryName,
      "CreatedAt ": createdAt,
    };
  }

  @override
  List<Object> get props => [
        userId,
        productId,
        productName,
        productDescription,
        productPrice,
        discountPercent,
        productImage,
        productQuantity,
        point,
        categoryId,
        categoryName,
        createdAt,
      ];
}
