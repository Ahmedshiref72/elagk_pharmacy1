import 'package:equatable/equatable.dart';

class PharmacyUser extends Equatable {
  final String? userId;
  final int pharmacyId;
  final String? pharmacyName;
  final String? pharmacyEmail;
  final String? imageUrl;
  final double longitude;
  final double latitude;
  final int? territoryId;
  // final List<String>? phones;

  const PharmacyUser({
    required this.userId,
    required this.pharmacyId,
    required this.pharmacyName,
    required this.pharmacyEmail,
    required this.imageUrl,
    required this.longitude,
    required this.latitude,
    required this.territoryId,
    // required this.phones,
  });

  @override
  List<Object?> get props => [
        userId,
        pharmacyId,
        pharmacyName,
        pharmacyEmail,
        imageUrl,
        longitude,
        latitude,
        territoryId,
        // phones,
      ];
}
