import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RatingWidget extends StatelessWidget {
  final double rating;

  const RatingWidget({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.5.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: rating > 3
            ? Color(0xff257e3e)
            : rating > 2
                ? Color(0xfff2c418)
                : Color(0xFFe13742),
        borderRadius: BorderRadius.circular(7.r),
      ),
      alignment: Alignment.center,
      child: Row(
        children: [
          Text(
            rating.toStringAsFixed(1),
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            width: 2.w,
          ),
          Icon(
            Icons.star,
            color: Colors.white,
            size: 14.sp,
          ),
        ],
      ),
    );
  }
}
