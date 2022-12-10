import 'package:dartz/dartz.dart';
import 'package:elagk_pharmacy/auth/data/datasource/base_auth_remote_datasource.dart';
import 'package:elagk_pharmacy/auth/domain/entities/email_activation_entity.dart';
import 'package:elagk_pharmacy/auth/domain/entities/forget_password_entity.dart';
import 'package:elagk_pharmacy/auth/domain/entities/login_pharmacy_entity.dart';
import 'package:elagk_pharmacy/auth/domain/entities/reset_password_entity.dart';
import 'package:elagk_pharmacy/auth/domain/entities/send_mail_entity.dart';
import 'package:elagk_pharmacy/auth/domain/repository/base_auth_repository.dart';
import 'package:elagk_pharmacy/auth/domain/usecases/activate_email_usecase.dart';
import 'package:elagk_pharmacy/auth/domain/usecases/forget_password_usecase.dart';
import 'package:elagk_pharmacy/auth/domain/usecases/login_usecase.dart';
import 'package:elagk_pharmacy/auth/domain/usecases/reset_password_usecase.dart';
import 'package:elagk_pharmacy/auth/domain/usecases/send_mail_usecase.dart';
import 'package:elagk_pharmacy/core/error/exceptions.dart';
import 'package:elagk_pharmacy/core/error/failure.dart';
import 'package:flutter/material.dart';

class AuthRepository extends BaseAuthRepository {
  final BaseAuthRemoteDataSource baseAuthRemoteDataSource;

  AuthRepository(this.baseAuthRemoteDataSource);

  // Login pharmacy screen
  @override
  Future<Either<Failure, LoginPharmacy>> login(
      LoginParameters parameters) async {
    try {
      final result = await baseAuthRemoteDataSource.login(parameters);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  // Forget password screen
  @override
  Future<Either<Failure, ForgetPassword>> forgetPassword(
      ForgetPasswordParameters parameters) async {
    try {
      final result = await baseAuthRemoteDataSource.forgetPassword(parameters);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, SendMail>> sendMail(
      SendMailParameters parameters) async {
    try {
      final result = await baseAuthRemoteDataSource.sendMail(parameters);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  // Activate email screen
  @override
  Future<Either<Failure, EmailActivation>> activateEmail(
      ActivationParameters parameters) async {
    try {
      final result = await baseAuthRemoteDataSource.activateEmail(parameters);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  // Reset password screen
  @override
  Future<Either<Failure, ResetPassword>> resetPassword(
      ResetPasswordParameters parameters) async {
    try {
      final result = await baseAuthRemoteDataSource.resetPassword(parameters);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
