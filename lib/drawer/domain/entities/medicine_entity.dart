import 'package:equatable/equatable.dart';

class Medicine extends Equatable {
  final String? userId;
  final int pharmacyId;
  final int productId;
  final String productName;
  final String? description;
  final double price;
  final double discountPercent;
  final String? imageUrl;
  final int point;
  final int categoryId;
  final String? categoryName;
  final int? quantity;
  final String? dose;
  final String? createdAt;

  const Medicine({
    required this.userId,
    required this.pharmacyId,
    required this.productId,
    required this.productName,
    required this.description,
    required this.price,
    required this.discountPercent,
    required this.imageUrl,
    required this.point,
    required this.categoryId,
    required this.categoryName,
    required this.quantity,
    required this.dose,
    required this.createdAt,
  });

  @override
  List<Object?> get props =>
      [
        userId,
        pharmacyId,
        productId,
        productName,
        description,
        price,
        discountPercent,
        imageUrl,
        point,
        categoryId,
        categoryName,
        quantity,
        dose,
        createdAt,
      ];


}
