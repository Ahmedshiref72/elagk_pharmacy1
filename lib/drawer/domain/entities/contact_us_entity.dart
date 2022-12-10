import 'package:equatable/equatable.dart';
class ContactUs extends Equatable {
  final String address;
  final String phoneNumber;
  final String email;
  final String whatsApp;
  final String facebook;
  final String instagram;

  const ContactUs({
    required this.address,
    required this.phoneNumber,
    required this.email,
    required this.whatsApp,
    required this.facebook,
    required this.instagram,
  });

  @override
  List<Object> get props => [
    address,
    phoneNumber,
    email,
    whatsApp,
    facebook,
    instagram,
  ];
}
