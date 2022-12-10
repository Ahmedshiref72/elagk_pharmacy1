import 'package:dartz/dartz.dart';
import 'package:elagk_pharmacy/auth/domain/entities/email_activation_entity.dart';
import 'package:elagk_pharmacy/auth/domain/repository/base_auth_repository.dart';
import 'package:elagk_pharmacy/core/error/failure.dart';
import 'package:elagk_pharmacy/core/usecase/base_usecase.dart';
import 'package:equatable/equatable.dart';

class ActivateEmailUseCase
    extends BaseUseCase<EmailActivation, ActivationParameters> {
  final BaseAuthRepository baseAuthRepository;

  ActivateEmailUseCase(this.baseAuthRepository);

  @override
  Future<Either<Failure, EmailActivation>> call(
      ActivationParameters parameters) async {
    return await baseAuthRepository.activateEmail(parameters);
  }
}

class ActivationParameters extends Equatable {
  final int code;

  const ActivationParameters({required this.code});

  @override
  List<Object> get props => [code];
}
