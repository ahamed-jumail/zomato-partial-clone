import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabBarForDeliveryScreen extends StatefulWidget {
  const TabBarForDeliveryScreen({super.key});

  @override
  State<TabBarForDeliveryScreen> createState() =>
      TabBarForDeliveryScreenState();
}

class TabBarForDeliveryScreenState extends State<TabBarForDeliveryScreen>
    with SingleTickerProviderStateMixin {
  String tabSelected = "Recommended";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                tabSelected = "Recommended";
              });
            },
            child: Container(
              width: 151.5.w,
              height: 40.h,
              decoration: BoxDecoration(
                border: Border.all(
                    color: tabSelected == "Recommended"
                        ? Colors.red
                        : Colors.grey),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.r),
                    bottomLeft: Radius.circular(10.r)),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Recommended"),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                tabSelected = "Collections";
              });
            },
            child: Container(
              width: 151.5.w,
              height: 40.h,
              decoration: BoxDecoration(
                border: Border.all(
                    color: tabSelected == "Collections"
                        ? Colors.red
                        : Colors.grey),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10.r),
                    bottomRight: Radius.circular(10.r)),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  tabSelected == "Collections"
                      ? Icon(
                          Icons.bookmark,
                          color: Colors.red,
                        )
                      : Icon(
                          Icons.bookmark_border_outlined,
                          color: Colors.red,
                        ),
                  Text("Collections"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
