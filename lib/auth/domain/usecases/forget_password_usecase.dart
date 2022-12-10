import 'package:dartz/dartz.dart';
import 'package:elagk_pharmacy/auth/domain/entities/forget_password_entity.dart';
import 'package:elagk_pharmacy/auth/domain/repository/base_auth_repository.dart';
import 'package:elagk_pharmacy/core/error/failure.dart';
import 'package:elagk_pharmacy/core/usecase/base_usecase.dart';
import 'package:equatable/equatable.dart';

class ForgetPasswordUseCase
    extends BaseUseCase<ForgetPassword, ForgetPasswordParameters> {
  final BaseAuthRepository baseAuthRepository;

  ForgetPasswordUseCase(this.baseAuthRepository);

  @override
  Future<Either<Failure, ForgetPassword>> call(
      ForgetPasswordParameters parameters) async {
    return await baseAuthRepository.forgetPassword(parameters);
  }
}

class ForgetPasswordParameters extends Equatable {
  final String email;

  const ForgetPasswordParameters({required this.email});

  @override
  List<Object> get props => [email];
}
