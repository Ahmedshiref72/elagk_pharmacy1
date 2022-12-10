import 'package:equatable/equatable.dart';

class SendMail extends Equatable {
  final String message;

  const SendMail({required this.message});

  @override
  List<Object> get props => [message];
}
