import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:zomato_partial_clone/views/widgets/recommended_restaurant_widget.dart';

class ApiForRecommendedRestaurantWidget extends StatefulWidget {
  const ApiForRecommendedRestaurantWidget({super.key});
  @override
  ApiForRecommendedRestaurantWidgetState createState() =>
      ApiForRecommendedRestaurantWidgetState();
}

class ApiForRecommendedRestaurantWidgetState
    extends State<ApiForRecommendedRestaurantWidget> {
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
          'https://crudcrud.com/api/a563451adf774c618489df9de391f847/appData');
      if (response.statusCode == 200) {
        setState(() {
          isLoading = false;
          final data = response.data[0];
          final recommendedData = data['data_for_RecommendedRestaurantWidget'];

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
    return Container(
      height: 326,
      padding: EdgeInsets.symmetric(vertical: 15),
      child: isLoading
          ? Center(child: CircularProgressIndicator())
          : restaurants.isEmpty
              ? Center(child: Text('No restaurants found'))
              : ListView.builder(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  itemCount: restaurants.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final restaurant = restaurants[index];
                    final restaurant2 = restaurants[9 - index];
                    return Column(
                      children: [
                        RecommendedRestaurantWidget(
                          imagePath: restaurant['imageUrl'],
                          offerApplicable: restaurant['offerApplicable'],
                          restaurantName: restaurant['restaurantName'],
                          deliveryTime: restaurant['deliveryTime'],
                          distance: restaurant['diatance'],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RecommendedRestaurantWidget(
                          imagePath: restaurant2['imageUrl'],
                          offerApplicable: restaurant2['offerApplicable'],
                          restaurantName: restaurant2['restaurantName'],
                          deliveryTime: restaurant2['deliveryTime'],
                          distance: restaurant2['diatance'],
                        ),
                      ],
                    );
                  },
                ),
    );
  }
}
