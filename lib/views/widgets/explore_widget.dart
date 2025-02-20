import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExploreWidget extends StatelessWidget {
  const ExploreWidget({super.key});

  Widget actionTile(String imagePath, String label1, String label2) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(12.sp),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            children: [
              Image.asset(
                imagePath,
                height: 50.h,
                width: 50.w,
              ),
              SizedBox(
                height: 8.h,
              ),
              Column(
                spacing: 0,
                children: [
                  Text(
                    label1,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                    ),
                  ),
                  Text(
                    label2,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          actionTile("assets/images/explore_offer.jpeg", "Offers", ""),
          actionTile("assets/images/explore_party.jpeg", "Plan", "a party"),
          actionTile("assets/images/explore_train.jpeg", "Food", "on Train"),
          actionTile("assets/images/explore_card.jpeg", "Gift", "Cards")
        ],
      ),
    );
  }
}
