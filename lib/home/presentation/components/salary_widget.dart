import 'package:flutter/material.dart';

class SalarySection extends StatelessWidget {
  const SalarySection({Key? key, required this.text, required this.text1, required this.color}) : super(key: key);

  final String text;
  final Color color;
  final String text1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         Text(
          text1,
          style:  TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: color),
        ),
        const Spacer(),
        Text(
          text,
          style:  TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: color),
        ),
      ],
    );
  }
}
