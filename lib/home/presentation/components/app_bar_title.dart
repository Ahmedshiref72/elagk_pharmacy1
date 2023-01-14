import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
final String text;
AppBarTitle({Key? key,required this.text }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children:
      [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
           Text(text,
             style: Theme.of(context).textTheme.titleMedium,
           )
          ],
        ),

      ],
    );
  }
}
