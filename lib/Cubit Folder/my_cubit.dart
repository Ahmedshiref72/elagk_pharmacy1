/*
// ignore_for_file: deprecated_member_use, avoid_function_literals_in_foreach_calls, prefer_typing_uninitialized_variables

import 'dart:convert';
import 'dart:io';

import 'package:elagy_pharmacy_app/core/utils/app_routes.dart';
import 'package:elagy_pharmacy_app/drawer/data/models/profile/add_medicine_models.dart';
import 'package:elagy_pharmacy_app/drawer/data/models/profile/all_medicines_model.dart';
import 'package:elagy_pharmacy_app/drawer/data/models/profile/edit_medicine.dart';
import 'package:elagy_pharmacy_app/drawer/data/models/profile/medicines.dart';
import 'package:elagy_pharmacy_app/drawer/data/models/profile/profile_medicines.dart' as prof;
import 'package:elagy_pharmacy_app/drawer/data/models/profile/one_pharmacy_model.dart';
import 'package:elagy_pharmacy_app/drawer/presentation/screens/complaints_screen.dart';
import 'package:elagy_pharmacy_app/home/data/models/orders/finish_order_model.dart';
import 'package:elagy_pharmacy_app/home/data/models/orders/one_order_model.dart';
import 'package:elagy_pharmacy_app/home/data/models/orders/pharmacy_orders.dart';
import 'package:elagy_pharmacy_app/home/data/models/orders/report_order_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

import '../auth/data/models/login_pharmacy_model.dart';
import '../home/presentation/screens/home_page.dart';
import '../drawer/presentation/screens/about_us_screen.dart';
import '../drawer/presentation/screens/contact_us_screen.dart';
import '../drawer/presentation/screens/pharmacy_user_profile_screen.dart';
import '../shared/drawer/menu_item.dart';
import '../shared/drawer/menu_screen.dart';
import '../core/utils/navigation.dart';
import '../core/http_helper_will_remove_it.dart';
import '../core/local/cache_helper.dart';
import 'my_states.dart';

class PharmacyCubit extends Cubit<PharmacyStates> {
  PharmacyCubit() : super(HomeInitState());

  static PharmacyCubit get(context) => BlocProvider.of(context);

  String api = "http://freelancerr-001-site1.btempurl.com/api/Auth/";
  static const String _baseUrlForQuery = 'freelancerr-001-site1.btempurl.com';
  static const String _lastUrlForQuery = '/api/Auth/';

  // AboutUsModel? aboutUsModel;

  // TODO: don't have endpoint.
  Future getAboutUs() async {
    emit(HomeGetAboutUsLoadingState());
    await HttpHelper.getData('about_us').then((value) async {
      debugPrint("token is : ${await FirebaseMessaging.instance.getToken()}");
      if (kDebugMode) {
        print("getAboutUs Before is : $value");
      }
      // aboutUsModel = AboutUsModel.fromJson(value);
      if (kDebugMode) {
        // print("aboutUsModel is : ${aboutUsModel.toString()}");
      }
      if (CacheHelper.getData(key: "token") != null) {
        if (kDebugMode) {
          print("Login true");
        }
        pharmacyOrders();
        if (kDebugMode) {
          print("PharmacyOrders true");
        }
        getCategories();
        if (kDebugMode) {
          print("getPharmacyProfile true");
        }
        getAllMedicines();
        if (kDebugMode) {
          print("getAllMedicines true");
        }
        getPharmacyProfileMedicines(0, false, CacheHelper.getData(key: 'id'));
      }
      if (kDebugMode) {
        print("getAboutUs after is : $value");
      }
      emit(HomeGetAboutUsSuccessState());
    }).catchError((e) {
      if (kDebugMode) {
        print("about us error is $e");
      }
      emit(HomeGetAboutUsErrorState());
    });
  }

  bool isLoadingAuth = false;

  void loadingAuthScreens(bool value) {
    isLoadingAuth = value;
    emit(HomeLoadingAutScreensState());
  }

  LoginPharmacyModel? loginPharmacyModel;

*/
/*  Future<void> login(
      {required String password,
      required String email,
      required BuildContext context}) async {
    loadingAuthScreens(true);
    emit(HomeRegisterLoadingState());
    var body = jsonEncode({
      'email': email,
      'password': password,
      // 'device_token': await FirebaseMessaging.instance.getToken(),
    });
    await http
        .post(
      Uri.parse('${api}token'),
      headers: {
        "Accept": "application/json",
        "content-type": "application/json"
      },
      body: body,
    )
        .then((value) {
      loginPharmacyModel = LoginPharmacyModel.fromJson(jsonDecode(value.body));
      if (kDebugMode) {
        print('Status code: ${value.statusCode}');
      }
      if (value.statusCode == 200) {
        CacheHelper.putData(
            key: "token", value: loginPharmacyModel!.data!.token.toString());
        CacheHelper.putData(
            key: "id", value: loginPharmacyModel!.data!.id.toString());
        if (kDebugMode) {
          print("**********************");
        }
        if (kDebugMode) {
          print("About us from login ");
        }
        // getAboutUs(); // TODO.
        if (kDebugMode) {
          print("About us from login true");
        }
        if (kDebugMode) {
          print("**********************");
        }
        if (kDebugMode) {
          print("PharmacyOrders from login ");
        }
        // pharmacyOrders(); // TODO.
        if (kDebugMode) {
          print("PharmacyOrders from login ");
        }
        if (kDebugMode) {
          print("**********************");
        }
        if (kDebugMode) {
          print("getCategories from login ");
        }
        // getCategories(); // TODO.
        if (kDebugMode) {
          print(
              "getCategories from login Pharmacy Id is : ${loginPharmacyModel!.data!.id.toString()}");
        }
        if (kDebugMode) {
          print("getCategories from login true");
        }
        if (kDebugMode) {
          print("**********************");
        }
        // getAllMedicines(); // TODO.
        if (kDebugMode) {
          print(
              "getAllMedicines from login Pharmacy Id is : ${loginPharmacyModel!.data!.id.toString()}");
          print("getAllMedicines from login true");
          print("**********************");
        }
        // getPharmacyProfileMedicines(0,false,CacheHelper.getData(key: 'id'));
        loadingAuthScreens(false);
        navigateFinalTo(context: context, screenRoute: Routes.homeDrawerScreen);
      } else {
        loadingAuthScreens(false);
        Fluttertoast.showToast(msg: "Try Again");
      }
      emit(HomeRegisterSuccessState());
    }).catchError((e) {
      if (kDebugMode) {
        print("error login is : $e");
        print(e.runtimeType);
      }
      Fluttertoast.showToast(msg: "there is a something wrong, Try Again");
      loadingAuthScreens(false);
      emit(HomeRegisterErrorState());
    });
  }*//*


  Future<void> resetPassword(
      {required String email, required BuildContext context}) async {
    loadingAuthScreens(true);
    emit(HomeRegisterLoadingState());
    var body = jsonEncode({'email': email});
    await http.post(
      Uri.parse('${api}ResetPassword'),
      body: body,
      headers: {
        'Accept': 'application/json',
        "content-type": "application/json"
      },
    ).then((value) {
      if (value.statusCode == 201) {
        Fluttertoast.showToast(msg: jsonDecode(value.body)['message'].toString());
        navigateFinalTo(context: context, screenRoute: Routes.loginPharmacyScreen);
        loadingAuthScreens(false);
        emit(HomeRegisterSuccessState());
      } else {
        Fluttertoast.showToast(msg: "The selected email is invalid.");
        if (kDebugMode) {
          print("The selected email is invalid : $email");
        }
        loadingAuthScreens(false);
        emit(HomeRegisterErrorState());
      }
    }).catchError((e) {
      loadingAuthScreens(false);
      Fluttertoast.showToast(msg: "The selected email is invalid.");
      if (kDebugMode) {
        print("resetPassword error is : $e");
      }
      emit(HomeRegisterErrorState());
    });
  }

  Future contactUS({
    required String body,
    required String title,
    required BuildContext context,
  }) async {
    loadingAuthScreens(true);
    emit(HomeRegisterLoadingState());
    await http.post(Uri.parse('${api}contact-us'), body: {
      'email': onePharmacyModel!.data!.email.toString(),
      'name': onePharmacyModel!.data!.name.toString(),
      'phone': onePharmacyModel!.data!.phone1.toString(),
      'body': body,
      'title': title
    }, headers: {
      'Accept': 'application/json'
    }).then((value) {
      if (jsonDecode(value.body)['code'] == 201) {
        Fluttertoast.showToast(msg: jsonDecode(value.body)['msg'].toString());
        if (kDebugMode) {
          print(jsonDecode(value.body)['msg'].toString());
        }
        loadingAuthScreens(false);
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                child: SizedBox(
                  height: 200,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/Login3/3elagk_word.png'),
                        const Text("شكرا لك يسعادنا دائما انك معانا",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                ),
              );
            });
        navigateFinalTo(context: context, screenRoute: Routes.allOrdersScreen);
        emit(HomeRegisterSuccessState());
      } else {
        loadingAuthScreens(false);
        Fluttertoast.showToast(msg: "برجاء ملئ جميع الحقول المطلوبة");
        emit(HomeRegisterErrorState());
      }
    }).catchError((e) {
      loadingAuthScreens(false);
      Fluttertoast.showToast(msg: "يرجي المحاولة في وقت لاحق");
      if (kDebugMode) {
        print("contactUS error is $e");
      }
      emit(HomeRegisterErrorState());
    });
  }

  getScreen(MyMenuItem currentItem) {
    switch (currentItem) {
      case MenuItems.homepage:
        return AllOrders();
      case MenuItems.profile:
        return const PharmacyUserProfileScreen();
      case MenuItems.contactUs:
        return const ContactUsScreen();
      case MenuItems.complients:
        return ComplaintsScreen();
      case MenuItems.aboutUs:
        return const AboutUsScreen();
    }
  }

  launchMap({required String lat, required String lng}) async {
    String url = '';
    String urlAppleMaps = '';
    if (Platform.isAndroid) {
      url = 'https://www.google.com/maps/search/?api=1&query=$lat,$lng';
    } else {
      urlAppleMaps = 'https://maps.apple.com/?q=$lat,$lng';
      url = 'comgooglemaps://?saddr=&daddr=$lat,$lng&directionsmode=driving';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    if (await canLaunch(url)) {
      await launch(url);
    } else if (await canLaunch(urlAppleMaps)) {
      await launch(urlAppleMaps);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  void openFaceBook(String pageLink) async {
    var url = 'fb://facewebmodal/f?href=$pageLink';
    if (await canLaunch(url)) {
      await launch(
        url,
        universalLinksOnly: true,
      );
    } else {
      throw 'There was a problem to open the url: $url';
    }
  }

  void whatsAppOpen(String number) async {
    String url() {
      if (Platform.isIOS) {
        return "whatsapp://wa.me/+2$number/?text=${Uri.encodeFull("مرحبَا، هل يمكنك إخباري بمواعيد العمل الخاصة بك؟")}";
      } else {
        return "whatsapp://send?phone=+2$number&text=${Uri.encodeFull("مرحبَا، هل يمكنك إخباري بمواعيد العمل الخاصة بك؟")}";
      }
    }

    launchUrl(Uri.parse(url()));
  }

  sendingMails(String url) async {
    url = 'mailto:feedback@$url';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  launchInstagram(String? username, String profileLink) async {
    String nativeUrl = "instagram://user?username=$username";
    String webUrl = profileLink;
    if (await canLaunch(nativeUrl)) {
      await launch(nativeUrl);
    } else if (await canLaunch(webUrl)) {
      await launch(webUrl);
    } else {
      debugPrint("can't open Instagram");
    }
  }

  openInstagram(String linkProfile) async {
    var url = 'https://www.instagram.com/$linkProfile/';

    if (await canLaunch(url)) {
      await launch(
        url,
        universalLinksOnly: true,
      );
    } else {
      throw 'There was a problem to open the url: $url';
    }
  }

  PharmacyOrdersModel? pharmacyOrdersModel;

  Future<void> pharmacyOrders() async {
    emit(HomeGetCitiesLoadingState());
    var uri = Uri.parse('${api}pharmacy-orders');
    var header = {
      "Accept": "application/json",
      'Authorization': 'Bearer ${CacheHelper.getData(key: 'token')}'
    };
    await http.get(uri, headers: header).then((value) {
      if (kDebugMode) {
        print("PharmacyOrders Before is : $value");
      }
      pharmacyOrdersModel =
          PharmacyOrdersModel.fromJson(jsonDecode(value.body));
      if (kDebugMode) {
        print("PharmacyOrders After is : $value");
      }
      pharmacyOrdersModel!.data!.sort(((b, a) => a.id!.compareTo(b.id!)));
      emit(HomeGetCitiesSuccessState());
    }).catchError((e) {
      if (kDebugMode) {
        print("PharmacyOrders error is : $e");
      }
      Fluttertoast.showToast(msg: '$e');
      emit(HomeGetCitiesErrorState());
    });
  }

*/
/*  PharmacyProfileModel? pharmacyProfileModel;

  Future<void> getPharmacyProfile(String id) async{
    emit(HomeGetCitiesLoadingState());
    var uri = Uri.parse('$api/pharmacy/$id');
    await http.get(uri, headers: {
      'Authorization': 'Bearer ${CacheHelper.getData(key: 'token')}',
      "Accept": "application/json"
    }).then((value) {
      print("getPharmacyProfile Before is : $value");
      pharmacyProfileModel = PharmacyProfileModel.fromJson(jsonDecode(value.body));
      print("getPharmacyProfile After is : $value");
      emit(HomeGetCitiesSuccessState());
    }).catchError((e) {
      print(e);
      Fluttertoast.showToast(msg: '$e');
      emit(HomeGetCitiesErrorState());
    });
  }*//*


  OneOrderModel? oneOrderModel;

  Future<void> getOneOrder(String id) async {
    oneOrderModel = null;
    emit(HomeGetCitiesLoadingState());
    await HttpHelper.getData('pharmacy-order/$id').then((value) {
      oneOrderModel = OneOrderModel.fromJson(value);
      if (kDebugMode) {
        print(oneOrderModel!.toJson().toString());
      }
      emit(HomeGetPharmaciesCatsSuccessState());
    }).catchError((e) {
      if (kDebugMode) {
        print("getOneOrder error is : ${e.toString()}");
      }
      emit(HomeGetPharmaciesCatsErrorState());
    });
  }

  OnePharmacyModel? onePharmacyModel;
  int selectedCategoryIndex = 0;
  bool isPaginationMedicinesLoading = false;
  PharmacyMedicinesModel? pharmacyMedicinesModel;

  Future<void> getMedicines(int page, bool isPagination, String departmentId,
      String pharmacyId) async {
    emit(HomeGetPharmacyMedicinesLoadingState());
    if (isPagination) {
      debugPrint("isPagination = true");
      isPaginationMedicinesLoading = true;
    } else {
      pharmacyMedicinesModel = null;
      debugPrint("isPagination = false");
    }
    await HttpHelper.getDataWithQuery('pharmacy-medicines', {
      'page': page.toString(),
      'department_id': departmentId,
      'pharmacy_id': pharmacyId
    }).then((value) async {
      if (kDebugMode) {
        print("getMedicines value is : $value");
      }
      if (isPagination) {
        pharmacyMedicinesModel!.paginate!.currentPage =
            value['paginate']['current_page'];
        value['paginate']['data'].forEach((e) {
          pharmacyMedicinesModel!.paginate!.data!.add(ActiveMedi.fromJson(e));
        });
        isPaginationMedicinesLoading = false;
      } else {
        pharmacyMedicinesModel = PharmacyMedicinesModel.fromJson(value);
      }
      emit(HomeGetPharmacyMedicinesSuccessState());
    }).catchError((error) {
      if (kDebugMode) {
        print("getMedicines error is : $error");
      }
      isPaginationMedicinesLoading = false;
      Fluttertoast.showToast(msg: 'error');
      emit(HomeGetPharmacyMedicinesErrorState());
    });
  }

  void changeCatIndex(int index) {
    emit(HomeChangeCatIndexState());
    debugPrint("changeCatIndex index : $index");
    selectedCategoryIndex = index;
    emit(HomeChangeCatIndexState());
    debugPrint(" changeCatIndex ++ getMedicines");
    getMedicines(
        1,
        false,
        onePharmacyModel!.data!.departments![index].id.toString(),
        onePharmacyModel!.data!.id.toString());
    emit(HomeChangeCatIndexState());
    debugPrint("changeCatIndex done");
  }

  Future getCategories() async {
    onePharmacyModel = null;
    emit(HomeGetPharmaciesCatsLoadingState());
    await HttpHelper.getData('pharmacy/${CacheHelper.getData(key: "id")}')
        .then((value) {
      onePharmacyModel = OnePharmacyModel.fromJson(value);
      emit(HomeGetPharmaciesCatsSuccessState());
      getMedicines(
          1,
          false,
          onePharmacyModel!.data!.departments![0].id.toString(),
          onePharmacyModel!.data!.id.toString());
    }).catchError((e) {
      if (kDebugMode) {
        print("getCategories error is : $e");
      }
      emit(HomeGetPharmaciesCatsErrorState());
    });
  }

  Future<void> logOutAccount(BuildContext context) async {
    emit(HomeGetCitiesLoadingState());
    var uri = Uri.parse('${api}client/logout');
    await http.post(uri, headers: {
      'Authorization': 'Bearer ${CacheHelper.getData(key: 'token')}',
      "Accept": "application/json"
    }).then((value) {
      if (kDebugMode) {
        print(jsonDecode(value.body));
      }
      CacheHelper.deleteData(key: 'token');
      Fluttertoast.showToast(msg: "تم تسجيل الخروج بنجاح");
      navigateFinalTo(
          context: context, screenRoute: Routes.loginPharmacyScreen);
      emit(HomeGetCitiesSuccessState());
    }).catchError((e) {
      if (kDebugMode) {
        print("logOutAccount error is $e");
      }
      Fluttertoast.showToast(msg: '$e');
      emit(HomeGetCitiesErrorState());
    });
  }

  FinishOrderModel? finishOrderModel;

  Future<void> finishOrder(String id, BuildContext context,
      String deliveryPrice, String price) async {
    var url =
        Uri.https(_baseUrlForQuery, '${_lastUrlForQuery}order/finish/$id', {
      'delivery_price': deliveryPrice.toString(),
      'price': price.toString(),
    });
    var header = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${CacheHelper.getData(key: "token")}'
    };
    await http.get(url, headers: header).then((value) {
      finishOrderModel = FinishOrderModel.fromJson(jsonDecode(value.body));
      if (finishOrderModel!.code == 201) {
        Fluttertoast.showToast(msg: finishOrderModel!.msg.toString());
        getAboutUs();
        navigateFinalTo(context: context, screenRoute: Routes.allOrdersScreen);
      }
    }).catchError((error) {
      if (kDebugMode) {
        print("finishOrder error is : $error");
      }
    });
  }

  ReportOrderModel? reportOrderModel;

  Future<void> reportOrder(String id, BuildContext context) async {
    var url = Uri.parse('${api}order/report/$id');
    var header = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${CacheHelper.getData(key: "token")}'
    };
    await http.post(url, headers: header).then((value) {
      reportOrderModel = ReportOrderModel.fromJson(jsonDecode(value.body));
      if (reportOrderModel!.code == 201) {
        Fluttertoast.showToast(msg: reportOrderModel!.msg.toString());
        getAboutUs();
        navigateFinalTo(context: context, screenRoute: Routes.allOrdersScreen);
      }
    }).catchError((error) {
      if (kDebugMode) {
        print("reportOrder error is : $error");
      }
    });
  }

  AddMedicineModel? addMedicineModel;

  Future<void> pharmacyAddMedicines(
      String price, String amount, BuildContext context) async {
    loadingAuthScreens(true);
    emit(PharmacyAddMedicinesLoadingState());
    var url = Uri.parse('${api}pharmacy/add_medicine');
    var header = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${CacheHelper.getData(key: "token")}'
    };
    var body = {'medicine_id': medId, 'price': price, 'amount': amount};
    await http.post(url, body: body, headers: header).then((value) {
      addMedicineModel = AddMedicineModel.fromJson(jsonDecode(value.body));
      if (addMedicineModel!.code == 201) {
        loadingAuthScreens(false);
        Fluttertoast.showToast(msg: "تم إضافة المنتج بنجاح");
        emit(PharmacyAddMedicinesSuccessState());
      }
    }).catchError((error) {
      loadingAuthScreens(false);
      Fluttertoast.showToast(msg: 'من فضلك حاول في وقت لاحق');
      if (kDebugMode) {
        print("pharmacyAddMedicines error is : $error");
      }
      emit(PharmacyAddMedicinesFailedState());
    });
  }

  EditMEdicine? editMEdicine;

  Future<void> pharmacyEditMedicines(
      String id, String price, String amount, BuildContext context) async {
    loadingAuthScreens(true);
    emit(PharmacyAddMedicinesLoadingState());
    var url = Uri.parse('${api}pharmacy/edit_medicine');
    var header = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${CacheHelper.getData(key: "token")}'
    };
    var body = {'medicine_id': id, 'price': price, 'amount': amount};
    await http.post(url, body: body, headers: header).then((value) {
      editMEdicine = EditMEdicine.fromJson(jsonDecode(value.body));
      if (editMEdicine!.code == 201) {
        debugPrint(value.body);
        loadingAuthScreens(false);
        Fluttertoast.showToast(msg: "تم تعديل المنتج بنجاح");
        emit(PharmacyAddMedicinesSuccessState());
      }
    }).catchError((error) {
      loadingAuthScreens(false);
      Fluttertoast.showToast(msg: 'من فضلك حاول في وقت لاحق');
      if (kDebugMode) {
        print("pharmacyAddMedicines error is : $error");
      }
      emit(PharmacyAddMedicinesFailedState());
    });
  }

  AllMedicines? allMedicines;
  List<String> itemsName = [];
  List<String> itemsID = [];
  var medId;

  Future<void> getAllMedicines() async {
    emit(PharmacyAddMedicinesLoadingState());
    var url = Uri.parse('${api}all-medicines');
    var header = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${CacheHelper.getData(key: "token")}'
    };
    await http.get(url, headers: header).then((value) {
      allMedicines = AllMedicines.fromJson(jsonDecode(value.body));
      if (allMedicines!.code == 200) {
        allMedicines!.data!.forEach((element) {
          itemsName.add(element.name.toString());
          itemsID.add(element.id.toString());
        });
        if (kDebugMode) {
          print("getAllMedicines done 200");
          print("allMedicines value is $allMedicines");
          print("allMedicines value.body is : ${value.body}");
          print("items list is : $itemsName");
          print("items list is : $itemsID");
        }
        emit(PharmacyAddMedicinesLoadingState());
      } else {
        if (kDebugMode) {
          print("getAllMedicines else error");
          print("allMedicines value is $allMedicines");
          print("allMedicines done 200");
        }
        emit(PharmacyAddMedicinesLoadingState());
      }
      emit(PharmacyAddMedicinesLoadingState());
    }).catchError((error) {
      emit(PharmacyAddMedicinesLoadingState());
      if (kDebugMode) {
        print("getAllMedicines error is : $error");
      }
    });
  }

  bool checkBoxValue = false;

  void changeValue(value) {
    checkBoxValue = value;
    emit(ChangeCheckBoxValueState());
  }

  prof.ProfileMedicines? profileMedicines;

  Future<void> getPharmacyProfileMedicines(
      int page, bool isPagination, String pharmacyId) async {
    emit(PharmacyAddMedicinesLoadingState());
    if (isPagination) {
      debugPrint("isPagination = true");
      isPaginationMedicinesLoading = true;
    } else {
      pharmacyMedicinesModel = null;
      debugPrint("isPagination = false");
    }
    await HttpHelper.getDataWithQuery('profile-pharmacy-medicines', {
      'page': page.toString(),
      'pharmacy_id': pharmacyId
    }).then((value) async {
      if (kDebugMode) {
        print("getPharmacyProfileMedicines value is : $value");
      }
      if (isPagination) {
        profileMedicines!.paginate!.currentPage =
            value['paginate']['current_page'];
        value['paginate']['data'].forEach((e) =>
            profileMedicines!.paginate!.data!.add(prof.Datum.fromJson(e)));
        isPaginationMedicinesLoading = false;
      } else {
        profileMedicines = prof.ProfileMedicines.fromJson(value);
      }
      emit(HomeGetPharmacyMedicinesSuccessState());
    }).catchError((error) {
      if (kDebugMode) {
        print("getMedicines error is : $error");
      }
      isPaginationMedicinesLoading = false;
      Fluttertoast.showToast(msg: 'error');
      emit(HomeGetPharmacyMedicinesErrorState());
    });
  }
}
*/
