import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDividerWidget extends StatelessWidget {
  final String centerText;

  const CustomDividerWidget({
    super.key,
    required this.centerText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Row(
        children: [
          Expanded(
              child: Container(
            height: 1.h,
            color: Color(0xffe6e9ef),
          )),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 1.w),
              child: Text(
                centerText,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: Color(0xff586377),
                    letterSpacing: 1.5),
              )),
          Expanded(
              child: Container(
            height: 1.h,
            color: Color(0xffe6e9ef),
          )),
        ],
      ),
    );
  }
}
