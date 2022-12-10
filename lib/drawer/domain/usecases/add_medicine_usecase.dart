import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:elagk_pharmacy/core/error/failure.dart';
import 'package:elagk_pharmacy/core/usecase/base_usecase.dart';
import 'package:elagk_pharmacy/drawer/domain/entities/medicine_entity.dart';
import 'package:elagk_pharmacy/drawer/domain/repository/base_drawer_repository.dart';
import 'package:equatable/equatable.dart';

class AddMedicineUseCase extends BaseUseCase<Medicine, AddMedicineParameters> {
  final BaseDrawerRepository baseDrawerRepository;

  AddMedicineUseCase(this.baseDrawerRepository);

  @override
  Future<Either<Failure, Medicine>> call(
      AddMedicineParameters parameters) async {
    return await baseDrawerRepository.addMedicine(parameters);
  }
}

class AddMedicineParameters extends Equatable {
  final String userId;
  final int pharmacyId;
  final int? productId;
  final String productName;
  final String? productDescription;
  final double? productPrice;
  final double? discountPercent;
  final File? productImage;
  final int? point;
  final int categoryId;
  final String? categoryName;
  final String? createdAt;

  const AddMedicineParameters({
    required this.userId,
    required this.pharmacyId,
    this.productId,
    required this.productName,
    this.productDescription,
    this.productPrice,
    this.discountPercent,
    this.productImage,
    this.point,
    required this.categoryId,
    this.categoryName,
    this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return {
      "UserId": userId,
      "PharmacyId": pharmacyId,
      "ProductId": productId,
      "ProductName ": productName,
      "Description": productDescription,
      "Price": productPrice,
      "DiscountPercent": discountPercent,
      "Image": productImage,
      "Point": point,
      "CategoryId": categoryId,
      "CategoryName": categoryName,
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
        createdAt,
      ];
}