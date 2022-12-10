import 'package:dartz/dartz.dart';
import 'package:elagk_pharmacy/auth/domain/entities/email_activation_entity.dart';
import 'package:elagk_pharmacy/auth/domain/entities/forget_password_entity.dart';
import 'package:elagk_pharmacy/auth/domain/entities/login_pharmacy_entity.dart';
import 'package:elagk_pharmacy/auth/domain/entities/reset_password_entity.dart';
import 'package:elagk_pharmacy/auth/domain/entities/send_mail_entity.dart';
import 'package:elagk_pharmacy/auth/domain/usecases/activate_email_usecase.dart';
import 'package:elagk_pharmacy/auth/domain/usecases/forget_password_usecase.dart';
import 'package:elagk_pharmacy/auth/domain/usecases/login_usecase.dart';
import 'package:elagk_pharmacy/auth/domain/usecases/reset_password_usecase.dart';
import 'package:elagk_pharmacy/auth/domain/usecases/send_mail_usecase.dart';
import 'package:elagk_pharmacy/core/error/failure.dart';

abstract class BaseAuthRepository {
  // Login pharmacy screen
  Future<Either<Failure, LoginPharmacy>> login(LoginParameters parameters);

  // Forget password screen
  Future<Either<Failure, ForgetPassword>> forgetPassword(
      ForgetPasswordParameters parameters);

  Future<Either<Failure, SendMail>> sendMail(SendMailParameters parameters);

  // Activate email screen
  Future<Either<Failure, EmailActivation>> activateEmail(
      ActivationParameters parameters);

  // Reset password screen
  Future<Either<Failure, ResetPassword>> resetPassword(
      ResetPasswordParameters parameters);
}
