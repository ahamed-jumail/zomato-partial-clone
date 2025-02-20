import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabSelected;

  const BottomNavigationBarWidget({
    super.key,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  Widget bottomNavigationBarItem({
    required String imageIcon,
    required String label,
    required bool isSelected,
    required Function() onTap,
  }) =>
      Expanded(
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            color: Colors.white,
            width: double.infinity,
            height: 56.h,
            margin: EdgeInsets.only(bottom: 2.h),
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Container(
                  width: 100.w,
                  height: 3.h,
                  color: isSelected ? Colors.redAccent : Colors.transparent,
                ),
                Spacer(),
                Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        imageIcon,
                        height: 20.h,
                        width: 20.w,
                        color: isSelected ? Colors.redAccent : Colors.grey,
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        label,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff1c1c1c),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      padding: EdgeInsets.zero,
      elevation: 0,
      height: 58.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          bottomNavigationBarItem(
            imageIcon: "assets/images/delivery_selected_icon.png",
            label: "Delivery",
            isSelected: selectedIndex == 0,
            onTap: () => onTabSelected(0),
          ),
          Container(
            width: 1.w,
            height: 25.h,
            padding: EdgeInsets.symmetric(vertical: 2.h),
            color: Color.fromARGB(255, 148, 150, 153),
          ),
          bottomNavigationBarItem(
            imageIcon: "assets/images/food-tray.png",
            label: "Dining",
            isSelected: selectedIndex == 1,
            onTap: () => onTabSelected(1),
          ),
        ],
      ),
    );
  }
}
