import 'package:dartz/dartz.dart';
import 'package:elagk_pharmacy/auth/domain/entities/send_mail_entity.dart';
import 'package:elagk_pharmacy/auth/domain/repository/base_auth_repository.dart';
import 'package:elagk_pharmacy/core/error/failure.dart';
import 'package:elagk_pharmacy/core/usecase/base_usecase.dart';
import 'package:equatable/equatable.dart';

class SendMailUseCase extends BaseUseCase<SendMail, SendMailParameters> {
  final BaseAuthRepository baseAuthRepository;

  SendMailUseCase(this.baseAuthRepository);

  @override
  Future<Either<Failure, SendMail>> call(SendMailParameters parameters) async {
    return await baseAuthRepository.sendMail(parameters);
  }
}

class SendMailParameters extends Equatable {
  final String email;
  // final String path;

  const SendMailParameters({required this.email});

  Map<String, dynamic> toJson() {
    return {
      "email": email
      // "path": path,
    };
  }

  @override
  List<Object> get props => [email];
}
