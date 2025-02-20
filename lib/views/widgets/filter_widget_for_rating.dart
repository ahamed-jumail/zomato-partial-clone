import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zomato_partial_clone/bloc/app_bloc/restaurant_item_bloc/restaurant_item_bloc.dart';

class FilterWidgetForRating extends StatefulWidget {
  final String tag;
  final String? icon;
  final bool hasMultipleOption;

  const FilterWidgetForRating(
      {super.key,
      required this.tag,
      this.icon,
      this.hasMultipleOption = false});

  @override
  FilterWidgetForRatingState createState() => FilterWidgetForRatingState();
}

class FilterWidgetForRatingState extends State<FilterWidgetForRating> {
  bool isFiltered = false;

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
            onTap: () {
              if (isFiltered) {
                context
                    .read<RestaurantItemBloc>()
                    .add(UnFilterRestaurantItemsEvent());
              } else {
                context
                    .read<RestaurantItemBloc>()
                    .add(FilterRestaurantItemsEvent());
              }
              setState(() {
                isFiltered = !isFiltered;
              });
            },
            child: Container(
              height: 40.h,
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
              decoration: BoxDecoration(
                color: isFiltered
                    ? const Color.fromARGB(255, 245, 203, 200)
                    : Colors.white,
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(
                    color: isFiltered
                        ? Colors.red
                        : Color.fromARGB(255, 167, 168, 170)),
              ),
              child: Row(
                children: [
                  if (widget.icon != null)
                    Padding(
                      padding: EdgeInsets.only(right: 4.w),
                      child: Image.asset(
                        widget.icon!,
                        color: Colors.black,
                        height: 15.h,
                        width: 15.w,
                      ),
                    ),
                  Text(
                    widget.tag,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0,
                        fontSize: 14.sp,
                        color: Color(0xff1c1c1c)),
                  ),
                  if (widget.hasMultipleOption)
                    Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black,
                      size: 16.sp,
                    ),
                  if (isFiltered)
                    SizedBox(
                      width: 6.w,
                    ),
                  if (isFiltered)
                    Icon(
                      Icons.close,
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
