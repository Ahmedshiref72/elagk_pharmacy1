/*

enum TextFieldValidatorType {
  Email,
  Password,
  ConfirmPassword,
  PhoneNumber,
  EmailNotRequire,
  NormalText,
  Code,
  Number,
  DisplayText,
  Optional,
  Name,
}

validation(
    {required TextFieldValidatorType type,
    required String value,
    required String firstPasswordForConfirm}) {
  if (type == TextFieldValidatorType.PhoneNumber) {
    if (value.isEmpty) {
      return isArabic ? 'هذا الحقل مطلوب' : '*required';
    } else if (value.length != 10) {
      return isArabic ?'يجب ان يكون 10 ارقام':'must be 10 digits';
    } else if (!regExpPhone.hasMatch(value.arabicNumberToEnglish)) {
      print('value.arabicNumberToEnglish');
      print(value.arabicNumberToEnglish);
      return isArabic ?'رقم الجوال غير صحيح':'invalid phone number';
    }
    return null;
  } else if (type == TextFieldValidatorType.Email) {
    if (value.isEmpty) {
      return isArabic ? 'هذا الحقل مطلوب' : '*required';
    } else if (!regExpEmail.hasMatch(value)) {
      return isArabic ? 'الميل غير صحيح' : 'invalid email';
    } else {
      return null;
    }
  } else if (type == TextFieldValidatorType.Password) {
    if (value.isEmpty) {
      return isArabic ? 'يجب إدخال كلمة السر' : '*please enter password';
    } else if (value.length < 6) {
      return isArabic
          ? 'كلمة السر يجب ألا تقل عن ستة أحرف'
          : 'password must be 6 chars or more';
    } else if (value.length > 30) {
      return isArabic
          ? 'كلمة السر يجب ألا تزيد عن ثلاثين حرفا'
          : 'password exceed max length';
    } else
      return null;
  } else if (type == TextFieldValidatorType.ConfirmPassword) {
    if (value.isEmpty) {
      return isArabic ? 'هذا الحقل مطلوب' : '*required';
    } else if (value != firstPasswordForConfirm) {
      return isArabic ? 'غير مطابق' : 'dismatch';
    } else {
      return null;
    }
  } else if (type == TextFieldValidatorType.Code) {
    if (value.isEmpty) {
      return isArabic ? 'هذا الحقل مطلوب' : '*required';
    }
  } else if (type == TextFieldValidatorType.Optional) {
    return null;
  } else if (type == TextFieldValidatorType.Number) {
    if (value.isEmpty) {
      return isArabic ? 'هذا الحقل مطلوب' : '*required';
    }
  }  else if (type == TextFieldValidatorType.NormalText) {
    if (value.isEmpty) {
      return isArabic ? 'هذا الحقل مطلوب' : '*required';
    }
  } else if (type == TextFieldValidatorType.EmailNotRequire) {
    if (value.isEmpty) {
      return null;
    } else if (!regExpEmail.hasMatch(value)) {
      return isArabic ? "الميل غير صحيح":'invalid email';
    } else {
      return null;
    }
  } else if (type == TextFieldValidatorType.DisplayText) {
    return null;
  } else if (type == TextFieldValidatorType.Name) {
    if (value.isEmpty) {
      return isArabic ? 'هذا الحقل مطلوب' : '*required';
    }
    if (!regExpName.hasMatch(value.trim().replaceAll('‎', ''))) {
      return isArabic
          ? 'لا يجب ان يحتوي علي حروف خاصة'
          : 'don\'t enter special chars';
    }

    return null;
  }
}
RegExp regExpPhone = RegExp(
  r'^(009665|9665|\+9665|05|5)(5|0|3|6|4|9|1|8|7)([0-9]{7})+$',
  caseSensitive: false,
  multiLine: false,
);

RegExp regExpEmail = RegExp(
  r'(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))+$',
  caseSensitive: false,
  multiLine: false,
);

RegExp regExpName =  RegExp(
  r"^[\p{L} ,.'-]*$",
  caseSensitive: false,
  unicode: true,
  dotAll: true,
  multiLine: false,
);

RegExp regExpNumber =  RegExp(
  r"^(?:[0]9)?[0-9]{10}$",
  caseSensitive: false,
  unicode: true,
  dotAll: true,
  multiLine: false,
);
*/

import 'package:elagk_pharmacy/core/utils/app_strings.dart';

String? validateEmail(String? value) {
  String pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";
  RegExp regex = RegExp(
    pattern,
    caseSensitive: false,
    multiLine: false,
  );
  if (value!.isEmpty || !regex.hasMatch(value)) {
    return AppStrings.enterValidEmail;
  } else {
    return null;
  }
}
