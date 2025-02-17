import 'dart:math';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:zomato_partial_clone/views/widgets/restaurant_item_widget.dart';

class ApiForRestaurantItemWidget extends StatefulWidget {
  const ApiForRestaurantItemWidget({super.key});

  @override
  ApiForRestaurantItemWidgetState createState() =>
      ApiForRestaurantItemWidgetState();
}

class ApiForRestaurantItemWidgetState
    extends State<ApiForRestaurantItemWidget> {
  late List<Map<String, dynamic>> restaurants;
  bool isLoading = true;
  bool isRatingFilterActive = false;

  @override
  void initState() {
    super.initState();
    fetchRatingFilterFlag();
    fetchRecommendedRestaurants();
  }

  Future<void> fetchRatingFilterFlag() async {
    try {
      final response = await Dio().get(
          'https://crudcrud.com/api/668670b8229a4d4ab8e0dd3a71cd51f0/appData');
      if (response.statusCode == 200) {
        final data = response.data[0];
        final ratingFilterFlag = data['flag_for_rating_filter'];
        setState(() {
          isRatingFilterActive = ratingFilterFlag == 'true';
        });
      } else {
        throw Exception('Failed to load rating filter flag');
      }
    } catch (e) {
      print("Error fetching rating filter flag: $e");
    }
  }

  Future<void> fetchRecommendedRestaurants() async {
    try {
      final response = await Dio().get(
          'https://crudcrud.com/api/668670b8229a4d4ab8e0dd3a71cd51f0/appData');

      if (response.statusCode == 200) {
        setState(() {
          isLoading = false;
          final data = response.data[0];
          final recommendedData = data['data_for_RestaurantItemWidget'];

          restaurants = List<Map<String, dynamic>>.from(recommendedData.values);

          if (isRatingFilterActive) {
            restaurants = restaurants
                .where((restaurant) => restaurant["rating"] >= 4.0)
                .toList();
          }
        });
      } else {
        throw Exception('Failed to load recommended restaurants');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print("Error fetching data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: isLoading
          ? Center(child: CircularProgressIndicator())
          : restaurants.isEmpty
              ? Center(child: Text('No restaurants found'))
              : ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: restaurants.length,
                  itemBuilder: (context, index) {
                    final restaurant = restaurants[index];
                    return RestaurantItemWidget(
                      imageUrl: restaurant['imageUrl'],
                      restaurantName: restaurant["restaurantName"],
                      rating: restaurant["rating"],
                      speciality: restaurant["speciality"],
                      foodType: restaurant["foodType"],
                      lowestPriceOfItem: restaurant["lowestPrice"],
                      deliveryTime: restaurant["deliveryTime"],
                      distance: restaurant["distance"],
                      discount:
                          "${Random().nextInt(60)}% OFF up to ${Random().nextInt(100)}",
                    );
                  }),
    );
  }
}
