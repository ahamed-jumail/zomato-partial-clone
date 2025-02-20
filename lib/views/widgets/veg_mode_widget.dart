import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VegModeToggle extends StatelessWidget {
  const VegModeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "VEG",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Text(
            "MODE",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 8.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          GestureDetector(
            child: SizedBox(
              width: 25.w,
              height: 25.h,
              child: Stack(
                children: [
                  Positioned(
                    top: 10.h,
                    child: Container(
                      width: 25.w,
                      height: 12.h,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                  ),
                  Positioned(
                    left: -3.w,
                    top: 7.h,
                    child: Container(
                      width: 18.w,
                      height: 18.h,
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
