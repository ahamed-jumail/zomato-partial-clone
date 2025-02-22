import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeliveryTimeAndDistanceForRecommendedRestaurantsWidget
    extends StatelessWidget {
  final String deliveryTime;
  final double distance;
  final Color? textColor;
  final EdgeInsets padding;
  final bool addPadding;

  const DeliveryTimeAndDistanceForRecommendedRestaurantsWidget({
    super.key,
    required this.deliveryTime,
    required this.distance,
    this.textColor,
    this.padding = EdgeInsets.zero,
    this.addPadding = true,
  });

  @override
  Widget build(BuildContext context) {
    var distanceText = "";
    if (distance >= 1000) {
      distanceText = "${(distance * 0.001).toStringAsFixed(0)} km";
    } else {
      distanceText = "$distance m";
    }
    return Padding(
      padding: padding == EdgeInsets.zero && addPadding
          ? EdgeInsets.only(bottom: 8.h)
          : padding,
      child: Row(
        children: [
          Icon(
            Icons.timelapse_rounded,
            color: Color(0xff257e3e),
            size: 15.sp,
          ),
          SizedBox(
            width: 4.w,
          ),
          Text(
            "$deliveryTime min",
            style: TextStyle(
                fontSize: 12.sp,
                color: textColor ?? Color(0xff586377).withOpacity(0.8),
                fontWeight: FontWeight.w400),
          ),
          Padding(
            padding: EdgeInsets.all(5.w),
            child: Icon(
              Icons.circle,
              size: 5.w,
              color: textColor ?? Color(0xff586377),
            ),
          ),
          Text(
            distanceText,
            style: TextStyle(
                fontSize: 12.sp,
                color: textColor ?? Color(0xff586377).withOpacity(0.8),
                fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
