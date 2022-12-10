import 'package:dio/dio.dart';
import 'package:elagk_pharmacy/auth/data/models/email_activation_model.dart';
import 'package:elagk_pharmacy/auth/data/models/forget_password_model.dart';
import 'package:elagk_pharmacy/auth/data/models/login_pharmacy_model.dart';
import 'package:elagk_pharmacy/auth/data/models/reset_password_model.dart';
import 'package:elagk_pharmacy/auth/data/models/send_mail_model.dart';
import 'package:elagk_pharmacy/auth/domain/usecases/activate_email_usecase.dart';
import 'package:elagk_pharmacy/auth/domain/usecases/forget_password_usecase.dart';
import 'package:elagk_pharmacy/auth/domain/usecases/login_usecase.dart';
import 'package:elagk_pharmacy/auth/domain/usecases/reset_password_usecase.dart';
import 'package:elagk_pharmacy/auth/domain/usecases/send_mail_usecase.dart';
import 'package:elagk_pharmacy/core/error/exceptions.dart';
import 'package:elagk_pharmacy/core/local/cache_helper.dart';
import 'package:elagk_pharmacy/core/network/api_constants.dart';
import 'package:elagk_pharmacy/core/network/error_message_model.dart';
import 'package:elagk_pharmacy/core/utils/app_constants.dart';

abstract class BaseAuthRemoteDataSource {
  // Login pharmacy screen
  Future<LoginPharmacyModel> login(LoginParameters parameters);

  // Forget password screen
  Future<ForgetPasswordModel> forgetPassword(
      ForgetPasswordParameters parameters);

  Future<SendMailModel> sendMail(SendMailParameters parameters);

  // Activate email screen
  Future<EmailActivationModel> activateEmail(ActivationParameters parameters);

  // Reset password screen
  Future<ResetPasswordModel> resetPassword(ResetPasswordParameters parameters);
}

class AuthRemoteDataSource extends BaseAuthRemoteDataSource {
  static const Map<String, String> headers = {
    'Content-Type': 'application/json'
  };

  Options options = Options(
    headers: headers,
    followRedirects: false,
    validateStatus: (status) {
      return status! < 500;
    },
  );

  @override
  Future<LoginPharmacyModel> login(LoginParameters parameters) async {
    final response = await Dio().post(
      ApiConstants.login,
      data: parameters.toJson(),
      options: options,
    );
    if (response.statusCode == 200) {
      CacheHelper.setData(key: AppConstants.userId, value: response.data[AppConstants.userId]);
      CacheHelper.setData(key: AppConstants.token, value: response.data[AppConstants.token]);
      return LoginPharmacyModel.fromJson(response.data);
    } else {
      print(response.data);
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<ForgetPasswordModel> forgetPassword(
      ForgetPasswordParameters parameters) async {
    final response = await Dio().get(
      ApiConstants.forgetPasswordEmailPath(parameters.email),
    );
    // success state.
    if (response.statusCode == 200) {
      // "response.data" = "email" or "Not Found". // TODO: handle it "in backend"
      return ForgetPasswordModel.fromJson(response.data);
      // failed state.
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<SendMailModel> sendMail(SendMailParameters parameters) async {
    final response = await Dio().post(
      ApiConstants.sendMail,
      data: parameters.toJson(),
      options: options,
    );
    if (response.statusCode == 200) {
      return SendMailModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<EmailActivationModel> activateEmail(
      ActivationParameters parameters) async {
    final response = await Dio().get(
      ApiConstants.activationCodePath(parameters.code),
      options: options,
    );
    if (response.statusCode == 200) {
      return EmailActivationModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<ResetPasswordModel> resetPassword(
      ResetPasswordParameters parameters) async {
    final response = await Dio().post(
      ApiConstants.resetPassword,
      data: parameters.toJson(),
      options: options,
    );
    if (response.statusCode == 200) {
      return ResetPasswordModel.fromJson(response.data);
      // failed state.
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
