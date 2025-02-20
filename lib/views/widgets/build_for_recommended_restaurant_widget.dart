import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zomato_partial_clone/bloc/app_bloc/recommended_restaurant_bloc/recommended_restaurant_bloc.dart';
import 'package:zomato_partial_clone/views/widgets/recommended_restaurant_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildForRecommendedRestaurantWidget extends StatefulWidget {
  const BuildForRecommendedRestaurantWidget({super.key});

  @override
  State<BuildForRecommendedRestaurantWidget> createState() =>
      BuildForRecommendedRestaurantWidgetState();
}

class BuildForRecommendedRestaurantWidgetState
    extends State<BuildForRecommendedRestaurantWidget> {
  late final RecommendedRestaurantBloc recommendedRestaurantBloc;

  @override
  void initState() {
    recommendedRestaurantBloc =
        BlocProvider.of<RecommendedRestaurantBloc>(context);
    final state = BlocProvider.of<RecommendedRestaurantBloc>(context).state;
    if (state is! RecommendedRestaurantLoaded) {
      recommendedRestaurantBloc.add(FetchRecommendedRestaurants());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 398.h,
      padding: EdgeInsets.symmetric(vertical: 15.h),
      child: BlocBuilder<RecommendedRestaurantBloc, RecommendedRestaurantState>(
        builder: (context, state) {
          if (state is RecommendedRestaurantLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is RecommendedRestaurantLoaded) {
            final restaurants = state.restaurants;
            return restaurants.isEmpty
                ? const Center(child: Text('No restaurants found'))
                : ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
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
                          SizedBox(height: 10.h),
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
            return Center(child: Text("Error in Fetching"));
          }
          return const Center(child: Text("Something went wrong"));
        },
      ),
    );
  }
}
