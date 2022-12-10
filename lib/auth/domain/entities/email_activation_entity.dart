import 'package:equatable/equatable.dart';

class EmailActivation extends Equatable {
  final String message;
  // May be = "Activation Failed" or "Activation Success".

  const EmailActivation({required this.message});

  @override
  List<Object> get props => [message];
}
