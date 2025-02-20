import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          height: 60.h,
          width: 60.w,
          fit: BoxFit.contain,
        ),
        SizedBox(
          height: 7.h,
        ),
        Text(
          recepieName,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12.sp,
            color: Color(0xff1c1c1c),
          ),
        )
      ],
    );
  }
}
