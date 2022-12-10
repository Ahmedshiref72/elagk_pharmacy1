import 'package:dartz/dartz.dart';
import 'package:elagk_pharmacy/auth/domain/entities/reset_password_entity.dart';
import 'package:elagk_pharmacy/auth/domain/repository/base_auth_repository.dart';
import 'package:elagk_pharmacy/core/error/failure.dart';
import 'package:elagk_pharmacy/core/usecase/base_usecase.dart';
import 'package:equatable/equatable.dart';

class ResetPasswordUseCase
    extends BaseUseCase<ResetPassword, ResetPasswordParameters> {
  final BaseAuthRepository baseAuthRepository;

  ResetPasswordUseCase(this.baseAuthRepository);

  @override
  Future<Either<Failure, ResetPassword>> call(
      ResetPasswordParameters parameters) async {
    return await baseAuthRepository.resetPassword(parameters);
  }
}

class ResetPasswordParameters extends Equatable {
  final String password;
  final String email;

  const ResetPasswordParameters({
    required this.password,
    required this.email,
  });

  Map<String, dynamic> toJson() {
    return {
      "password": password,
      "email": email,
    };
  }

  @override
  List<Object> get props => [password, email];
}
