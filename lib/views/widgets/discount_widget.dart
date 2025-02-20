import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zomato_partial_clone/views/widgets/offer_icon_widget.dart';

class DiscountWidget extends StatelessWidget {
  final String discount;
  final EdgeInsets padding;
  final double iconSize;
  final double textSize;

  const DiscountWidget({
    super.key,
    required this.discount,
    this.iconSize = 20,
    this.textSize = 13,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding == EdgeInsets.zero
          ? EdgeInsets.only(top: 8.h, bottom: 4.h)
          : padding,
      child: Row(
        children: [
          OfferIconWidget(iconSize: iconSize.sp),
          SizedBox(width: 5.w),
          Text(
            discount,
            style: TextStyle(fontSize: textSize.sp, color: Color(0xff1c1c1c)),
          )
        ],
      ),
    );
  }
}
