import 'package:elagk_pharmacy/core/utils/app_values.dart';
import 'package:flutter/material.dart';

class ScoundButton extends StatelessWidget {
  const ScoundButton({Key? key, required this.onPressed, required this.mainColor, required this.scoundColor, required this.text,}) : super(key: key);
  final Function onPressed;
  final Color mainColor;
  final Color scoundColor;
  final String text;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(),
      child: Container(
        decoration: BoxDecoration(color:scoundColor),
        width: AppSize.s100,
        height: AppSize.s50,
        child: Center(
            child: Text(
          text,
          style: TextStyle(
              color:mainColor, fontSize: 20, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
