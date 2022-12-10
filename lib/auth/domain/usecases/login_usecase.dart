import 'package:dartz/dartz.dart';
import 'package:elagk_pharmacy/auth/domain/entities/login_pharmacy_entity.dart';
import 'package:elagk_pharmacy/auth/domain/repository/base_auth_repository.dart';
import 'package:elagk_pharmacy/core/error/failure.dart';
import 'package:elagk_pharmacy/core/usecase/base_usecase.dart';
import 'package:equatable/equatable.dart';

class LoginUseCase extends BaseUseCase<LoginPharmacy, LoginParameters> {
  final BaseAuthRepository baseAuthRepository;

  LoginUseCase(this.baseAuthRepository);

  @override
  Future<Either<Failure, LoginPharmacy>> call(LoginParameters parameters) async {
    return await baseAuthRepository.login(parameters);
  }
}

class LoginParameters extends Equatable {
  final String email;
  final String password;

  const LoginParameters({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password
    };
  }

  @override
  List<Object> get props => [email, password];
}
