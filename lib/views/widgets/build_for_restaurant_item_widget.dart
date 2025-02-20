import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zomato_partial_clone/bloc/app_bloc/restaurant_item_bloc/restaurant_item_bloc.dart';
import 'package:zomato_partial_clone/views/widgets/restaurant_item_widget.dart';

class BuildForRestaurantItemWidget extends StatefulWidget {
  const BuildForRestaurantItemWidget({super.key});

  @override
  State<BuildForRestaurantItemWidget> createState() =>
      BuildForRestaurantItemWidgetState();
}

class BuildForRestaurantItemWidgetState
    extends State<BuildForRestaurantItemWidget> {
  late final RestaurantItemBloc restaurantItemBloc;

  @override
  void initState() {
    restaurantItemBloc = BlocProvider.of<RestaurantItemBloc>(context);
    final state = BlocProvider.of<RestaurantItemBloc>(context).state;
    if (state is! RestaurantItemLoaded) {
      restaurantItemBloc.add(FetchRestaurantItems());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantItemBloc, RestaurantItemState>(
      builder: (context, state) {
        if (state is RestaurantItemLoading) {
          return SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (state is RestaurantItemLoaded) {
          final restaurants = state.restaurants;
          return restaurants.isEmpty
              ? SliverToBoxAdapter(
                  child: Center(child: Text('No restaurants found')))
              : SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: restaurants.length,
                    (context, index) {
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
                  ),
                );
        } else if (state is RestaurantItemError) {
          return SliverToBoxAdapter(
              child: Center(child: Text("Error in fetching")));
        } else {
          return SliverToBoxAdapter(child: SizedBox.shrink());
        }
      },
    );
  }
}
