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

  @override
  void initState() {
    super.initState();
    fetchRecommendedRestaurants();
  }

  Future<void> fetchRecommendedRestaurants() async {
    try {
      final response = await Dio().get(
          'https://crudcrud.com/api/fcb8b14ef2f5434381ab6f4e21396ef2/appData');

      if (response.statusCode == 200) {
        setState(() {
          isLoading = false;
          final data = response.data[0];
          final recommendedData = data['data_for_RestaurantItemWidget'];

          restaurants = List<Map<String, dynamic>>.from(recommendedData.values);
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
                  itemCount: 10,
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
