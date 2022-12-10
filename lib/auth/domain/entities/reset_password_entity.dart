import 'package:equatable/equatable.dart';

class ResetPassword extends Equatable {
  final String message;

  const ResetPassword({required this.message});

  @override
  List<Object> get props => [message];
}