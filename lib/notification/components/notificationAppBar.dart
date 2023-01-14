
import 'package:elagk_pharmacy/core/utils/app_values.dart';
import 'package:flutter/material.dart';


PreferredSizeWidget NotificationAppBar({
  required BuildContext context,
  required String title,

}) =>
    AppBar(
      iconTheme: const IconThemeData(color: Colors.black),
      title: Text(title,
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black)),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: AppSize.s0,
      automaticallyImplyLeading: true,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back),
      ),

    );
