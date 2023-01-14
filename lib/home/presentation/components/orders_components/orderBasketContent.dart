import 'package:elagk_pharmacy/core/utils/app_values.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:full_screen_image_null_safe/full_screen_image_null_safe.dart';

class OrderInBasketContent extends StatelessWidget {
  const OrderInBasketContent({
    Key? key,
    required this.categoriesName,
    required this.imageSrc,
    required this.price,
    required this.quantity,
  }) : super(key: key);

  final String categoriesName;
  final double price;
  final String imageSrc;
  final String quantity;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: AppSize.s110,
          width: mediaQueryWidth(context) * .952,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(AppSize.s20),
          ),
          child: Row(
            children: [
              InkWell(
                  onTap: () {

                  },
                  child: FullScreenWidget(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image(
                              image: NetworkImage(
                                "$imageSrc",

                              ),
                              width: 60,
                              height: 60,
                            ),
                          ),
                        )),
              SizedBox(
                width: mediaQueryWidth(context) / 18,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: mediaQueryHeight(context) / AppSize.s50),
                    Row(
                      children: [
                        Text(
                          categoriesName,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        SizedBox(width: mediaQueryWidth(context) / AppSize.s7),
                        Text(
                          ' $price جنية   ',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(height: mediaQueryHeight(context) / AppSize.s50),
                    Row(
                      children: [
                        const Text(
                          'الكمية : ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        SizedBox(width: mediaQueryWidth(context) / AppSize.s20),
                        Text(
                          quantity,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
