import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InformationContentSection extends StatelessWidget {
   const InformationContentSection({Key? key, required this.text, required this.image, required this.text1}) : super(key: key);
  final String text;
  final String text1;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Row(
          children: [
            Image.asset(
              image,
              width: 30,
              height: 30,
            ),
            const SizedBox(
              width: 10,
            ),

            Text(
              text,
              style: Theme.of(context).textTheme.displayLarge,
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
