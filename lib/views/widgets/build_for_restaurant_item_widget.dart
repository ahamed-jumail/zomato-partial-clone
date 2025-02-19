import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zomato_partial_clone/bloc/app_bloc/restaurant_item_bloc/restaurant_item_bloc.dart';
import 'package:zomato_partial_clone/views/widgets/restaurant_item_widget.dart';

class BuildForRestaurantItemWidget extends StatelessWidget {
  const BuildForRestaurantItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantItemBloc, RestaurantItemState>(
      builder: (context, state) {
        if (state is RestaurantItemLoading) {
          return SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (state is RestaurantItemError) {
          return SliverToBoxAdapter(child: Center(child: Text(state.error)));
        } else if (state is RestaurantItemLoaded ||
            state is RestaurantItemLoadingMore) {
          final restaurants = state is RestaurantItemLoaded
              ? state.restaurants
              : (state as RestaurantItemLoadingMore).restaurants;

          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                if (index == restaurants.length) {
                  return Center(child: CircularProgressIndicator());
                }
                final restaurant = restaurants[index];
                return RestaurantItemWidget(
                  imageUrl: restaurant.imageUrl,
                  restaurantName: restaurant.restaurantName,
                  rating: restaurant.rating,
                  speciality: restaurant.speciality,
                  foodType: restaurant.foodType,
                  lowestPriceOfItem: restaurant.lowestPrice,
                  deliveryTime: restaurant.deliveryTime,
                  distance: restaurant.distance,
                  discount:
                      "${Random().nextInt(60)}% OFF up to \u{20B9}${Random().nextInt(100)}",
                );
              },
              childCount: restaurants.length +
                  (state is RestaurantItemLoadingMore ? 1 : 0),
            ),
          );
        } else {
          return SliverToBoxAdapter(child: SizedBox.shrink());
        }
      },
    );
  }
}
