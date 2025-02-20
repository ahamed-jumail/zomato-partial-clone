import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zomato_partial_clone/views/widgets/rating_widget.dart';

class RestaurantNameAndRatingWidget extends StatelessWidget {
  final String restaurantName;
  final double rating;
  final double textSize;

  const RestaurantNameAndRatingWidget({
    super.key,
    required this.restaurantName,
    required this.rating,
    this.textSize = 18,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          restaurantName,
          style: TextStyle(
              fontSize: textSize.sp,
              color: Color(0xff1c1c1c),
              fontWeight: FontWeight.w600),
        ),
        Spacer(),
        RatingWidget(rating: rating),
      ],
    );
  }
}
