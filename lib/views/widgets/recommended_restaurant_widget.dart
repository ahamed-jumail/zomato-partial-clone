import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zomato_partial_clone/views/widgets/delivery_time_and_distance_for_recommended_restaurants_widget.dart';

class RecommendedRestaurantWidget extends StatelessWidget {
  final String imagePath;
  final String offerApplicable;
  final String restaurantName;
  final String deliveryTime;
  final double distance;

  const RecommendedRestaurantWidget({
    super.key,
    required this.imagePath,
    required this.offerApplicable,
    required this.restaurantName,
    required this.deliveryTime,
    required this.distance,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110.w,
      margin: EdgeInsets.symmetric(horizontal: 8.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: Image.network(
                  imagePath,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 110.h,
                ),
              ),
              Positioned(
                top: 0.h,
                right: 1.w,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsets.all(5.w),
                  child: Icon(
                    Icons.bookmark_border_outlined,
                    color: Colors.white,
                    size: 20.sp,
                  ),
                ),
              ),
              Positioned(
                bottom: 1.h,
                left: 2.w,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.h),
                  child: Text(
                    offerApplicable,
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 6.h),
          Text(
            restaurantName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 1.h),
          DeliveryTimeAndDistanceForRecommendedRestaurantsWidget(
            deliveryTime: deliveryTime,
            distance: distance,
          ),
        ],
      ),
    );
  }
}
