import 'package:flutter/material.dart';

showWarningDialog({
  required BuildContext context,
  required Function()? onDeletePressed,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Text('هل أنت متأكد من حذف المنتج؟'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('إلغاء'),
          ),
          TextButton(
            onPressed: onDeletePressed,
            child: Text('حذف'),
          ),
        ],
      );
    },
  );
}
