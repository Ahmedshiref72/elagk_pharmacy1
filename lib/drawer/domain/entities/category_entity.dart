import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final int categoryId;
  final String categoryName;
  final String imageUrl;
  final String createdAt;

  const Category({
    required this.categoryId,
    required this.categoryName,
    required this.imageUrl,
    required this.createdAt,
  });

  @override
  List<Object> get props => [
        categoryId,
        categoryName,
        imageUrl,
        createdAt,
      ];
}
