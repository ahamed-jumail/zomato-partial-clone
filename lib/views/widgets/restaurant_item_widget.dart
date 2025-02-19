import 'package:flutter/material.dart';
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
        margin: EdgeInsets.symmetric(horizontal: 15).copyWith(bottom: 20),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Column(
            children: [
              Stack(
                children: [
                  Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 200,
                  ),
                  Positioned(
                    top: 1,
                    right: 8,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Icon(
                            Icons.bookmark_border_outlined,
                            color: Colors.white,
                            size: 25,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.visibility_off_outlined,
                            color: Colors.white,
                            size: 25,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(10).copyWith(left: 12),
                child: Column(
                  children: [
                    DeliveryTimeAndDistanceWidget(
                      deliveryTime: deliveryTime,
                      distance: distance,
                    ),
                    RestaurantNameAndRatingWidget(
                        restaurantName: restaurantName, rating: rating),
                    Padding(
                      padding: EdgeInsets.only(top: 2, bottom: 6),
                      child: Row(
                        children: [
                          Text(
                            speciality,
                            style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff586377).withOpacity(0.8),
                                fontWeight: FontWeight.w400),
                          ),
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Icon(
                              Icons.circle,
                              size: 5,
                            ),
                          ),
                          Text(
                            foodType,
                            style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff586377).withOpacity(0.8),
                                fontWeight: FontWeight.w400),
                          ),
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Icon(
                              Icons.circle,
                              size: 5,
                            ),
                          ),
                          Text(
                            "\u{20B9}$lowestPriceOfItem for one",
                            style: TextStyle(
                                fontSize: 14,
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
