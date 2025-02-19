import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zomato_partial_clone/bloc/app_bloc/recommended_restaurant_bloc/recommended_restaurant_bloc.dart';
import 'package:zomato_partial_clone/views/widgets/recommended_restaurant_widget.dart';

class BuildForRecommendedRestaurantWidget extends StatelessWidget {
  const BuildForRecommendedRestaurantWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 326,
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: BlocBuilder<RecommendedRestaurantBloc, RecommendedRestaurantState>(
        builder: (context, state) {
          if (state is RecommendedRestaurantLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is RecommendedRestaurantLoaded) {
            final restaurants = state.restaurants;
            return restaurants.isEmpty
                ? const Center(child: Text('No restaurants found'))
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    itemCount: restaurants.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final restaurant = restaurants[index];
                      final restaurant2 =
                          restaurants[restaurants.length - 1 - index];
                      return Column(
                        children: [
                          RecommendedRestaurantWidget(
                            imagePath: restaurant.imageUrl,
                            offerApplicable: restaurant.offerApplicable,
                            restaurantName: restaurant.restaurantName,
                            deliveryTime: restaurant.deliveryTime,
                            distance: restaurant.distance,
                          ),
                          const SizedBox(height: 10),
                          RecommendedRestaurantWidget(
                            imagePath: restaurant2.imageUrl,
                            offerApplicable: restaurant2.offerApplicable,
                            restaurantName: restaurant2.restaurantName,
                            deliveryTime: restaurant2.deliveryTime,
                            distance: restaurant2.distance,
                          ),
                        ],
                      );
                    },
                  );
          } else if (state is RecommendedRestaurantError) {
            return Center(child: Text(state.message));
          }
          return const Center(child: Text("Something went wrong"));
        },
      ),
    );
  }
}
