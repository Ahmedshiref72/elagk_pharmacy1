import 'package:elagk_pharmacy/core/global/app_colors.dart';
import 'package:elagk_pharmacy/core/utils/app_values.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class InformationContentSection2 extends StatelessWidget {
  const InformationContentSection2({Key? key,
    required this.text, required this.text1, required this.child, required this.ontap}) : super(key: key);
  final String text;
  final String text1;
  final Function() ontap;

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Row(
          children: [
            child,
            const SizedBox(
              width: 10,
            ),

            Text(
              text,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            Spacer(),
            InkWell(
              onTap: ontap,
              child: Container(
                width: AppSize.s40,
                height: AppSize.s40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: AppColors.offWhite,
                    width: AppSize.s1,
                  ),
                  borderRadius: BorderRadius.circular(AppSize.s15),
                ),
                child: Icon(Icons.my_location),
              ),
            ),
          ],
        ),
        Text(
          text1,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
      ],
    );
  }
}
