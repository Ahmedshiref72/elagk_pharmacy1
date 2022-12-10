import 'package:equatable/equatable.dart';

class ForgetPassword extends Equatable {
  final String email; // May be = "Not Found" instead of email.

  const ForgetPassword({required this.email});

  @override
  List<Object> get props => [email];
}
