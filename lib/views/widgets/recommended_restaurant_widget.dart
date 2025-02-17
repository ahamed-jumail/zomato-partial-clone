import 'package:flutter/material.dart';
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
      width: 120,
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  imagePath,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 90,
                ),
              ),
              Positioned(
                top: 1,
                right: 2,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsets.all(5),
                  child: Icon(
                    Icons.bookmark_border_outlined,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
              Positioned(
                bottom: 1,
                left: 2,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                  child: Text(
                    offerApplicable,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 6),
          Text(
            restaurantName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 1),
          DeliveryTimeAndDistanceForRecommendedRestaurantsWidget(
            deliveryTime: deliveryTime,
            distance: distance,
          ),
        ],
      ),
    );
  }
}
