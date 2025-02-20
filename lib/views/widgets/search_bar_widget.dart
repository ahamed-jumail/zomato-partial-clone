import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchBarWidget extends StatelessWidget {
  final String? hint;
  final Color? hintColor;
  final TextEditingController? controller;
  final IconData? leading;
  final bool? isChangingHint;
  final String? hintType;

  const SearchBarWidget({
    super.key,
    this.hint,
    this.hintColor,
    this.controller,
    this.leading,
    this.isChangingHint,
    this.hintType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15.r)),
        border: Border.fromBorderSide(
          BorderSide(color: Color.fromARGB(255, 167, 168, 170), width: 1.w),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Icon(
              leading,
              color: Colors.redAccent,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: 25.h),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: hintColor,
                  ),
                  border: InputBorder.none,
                ),
                style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
                onTap: () {},
              ),
            ),
          ),
          Container(
            width: 1.w,
            height: 25.h,
            padding: EdgeInsets.symmetric(vertical: 2.h),
            color: Color.fromARGB(255, 215, 220, 230),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Icon(
              Icons.mic_none,
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}
