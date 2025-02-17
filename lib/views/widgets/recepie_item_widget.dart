import 'package:flutter/material.dart';

class RecepieItemWidget extends StatelessWidget {
  final String recepieName;
  final String recepieImage;

  const RecepieItemWidget({
    super.key,
    required this.recepieName,
    required this.recepieImage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          recepieImage,
          height: 60,
          width: 60,
          fit: BoxFit.contain,
        ),
        SizedBox(
          height: 7,
        ),
        Text(
          recepieName,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: Color(0xff1c1c1c),
          ),
        )
      ],
    );
  }
}
