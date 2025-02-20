import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterWidget extends StatelessWidget {
  final String tag;
  final String? icon;
  final bool hasMultipleOption;

  const FilterWidget({
    super.key,
    required this.tag,
    this.icon,
    this.hasMultipleOption = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8.w),
      child: Center(
        child: Material(
          borderRadius: BorderRadius.circular(10.r),
          color: Colors.white,
          child: InkWell(
            borderRadius: BorderRadius.circular(10.r),
            onTap: () {},
            child: Container(
              height: 40.h,
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: Color.fromARGB(255, 167, 168, 170)),
              ),
              child: Row(
                children: [
                  if (icon != null)
                    Padding(
                      padding: EdgeInsets.only(right: 4.w),
                      child: Image.asset(
                        icon!,
                        color: Colors.black,
                        height: 15.h,
                        width: 15.w,
                      ),
                    ),
                  Text(
                    tag,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0,
                        fontSize: 14.sp,
                        color: Color(0xff1c1c1c)),
                  ),
                  if (hasMultipleOption)
                    Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black,
                      size: 16.sp,
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
