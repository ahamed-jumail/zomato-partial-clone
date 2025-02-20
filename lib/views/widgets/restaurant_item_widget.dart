import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zomato_partial_clone/views/widgets/custom_dashed_divider.dart';
import 'package:zomato_partial_clone/views/widgets/delivery_time_and_distance_widget.dart';
import 'package:zomato_partial_clone/views/widgets/discount_widget.dart';
import 'package:zomato_partial_clone/views/widgets/restaurant_name_and_rating_widget.dart';

class RestaurantItemWidget extends StatelessWidget {
  final String imageUrl;
  final String restaurantName;
  final double rating;
  final String speciality;
  final String foodType;
  final double lowestPriceOfItem;
  final String deliveryTime;
  final double distance;
  final String discount;

  const RestaurantItemWidget(
      {super.key,
      required this.imageUrl,
      required this.restaurantName,
      required this.rating,
      required this.speciality,
      required this.foodType,
      required this.lowestPriceOfItem,
      required this.deliveryTime,
      required this.distance,
      required this.discount});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15.w).copyWith(bottom: 20.h),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.r),
          child: Column(
            children: [
              Stack(
                children: [
                  Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 200.h,
                  ),
                  Positioned(
                    top: 1.h,
                    right: 8.w,
                    child: Container(
                      padding: EdgeInsets.all(5.w),
                      child: Row(
                        children: [
                          Icon(
                            Icons.bookmark_border_outlined,
                            color: Colors.white,
                            size: 25.sp,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Icon(
                            Icons.visibility_off_outlined,
                            color: Colors.white,
                            size: 25.sp,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(10.w).copyWith(left: 12.w),
                child: Column(
                  children: [
                    DeliveryTimeAndDistanceWidget(
                      deliveryTime: deliveryTime,
                      distance: distance,
                    ),
                    RestaurantNameAndRatingWidget(
                        restaurantName: restaurantName, rating: rating),
                    Padding(
                      padding: EdgeInsets.only(top: 2.h, bottom: 6.h),
                      child: Row(
                        children: [
                          Text(
                            speciality,
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: Color(0xff586377).withOpacity(0.8),
                                fontWeight: FontWeight.w400),
                          ),
                          Padding(
                            padding: EdgeInsets.all(5.w),
                            child: Icon(
                              Icons.circle,
                              size: 5.sp,
                            ),
                          ),
                          Text(
                            foodType,
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: Color(0xff586377).withOpacity(0.8),
                                fontWeight: FontWeight.w400),
                          ),
                          Padding(
                            padding: EdgeInsets.all(5.w),
                            child: Icon(
                              Icons.circle,
                              size: 5.sp,
                            ),
                          ),
                          Text(
                            "\u{20B9}${lowestPriceOfItem.toStringAsFixed(0)} for one",
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: Color(0xff586377).withOpacity(0.8),
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    CustomDashedDivider(),
                    DiscountWidget(discount: discount)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
