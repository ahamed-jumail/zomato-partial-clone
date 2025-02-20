import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zomato_partial_clone/views/widgets/filter_widget.dart';
import 'package:zomato_partial_clone/views/widgets/filter_widget_for_rating.dart';

class BuildForFilterWidget extends StatelessWidget {
  const BuildForFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      title: Container(
        height: 50.h,
        margin: EdgeInsets.symmetric(vertical: 14.h),
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(right: 1.w),
          scrollDirection: Axis.horizontal,
          children: [
            FilterWidget(
              tag: "Sort",
              icon: "assets/images/filter_icon.png",
              hasMultipleOption: true,
            ),
            FilterWidgetForRating(
              tag: "Rating 4.0+",
            ),
            FilterWidget(tag: "Great Offers"),
            FilterWidget(tag: "Previously Ordered"),
            FilterWidget(tag: "Pure Veg"),
            FilterWidget(
              tag: "Cuisines",
              hasMultipleOption: true,
            ),
            FilterWidget(
              tag: "Schedule",
              hasMultipleOption: true,
            ),
          ],
        ),
      ),
      pinned: true,
    );
  }
}
