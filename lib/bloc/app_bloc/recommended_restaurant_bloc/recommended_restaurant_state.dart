part of 'recommended_restaurant_bloc.dart';

abstract class RecommendedRestaurantState extends ErrorState {}

class RecommendedRestaurantInitial extends RecommendedRestaurantState {}

class RecommendedRestaurantLoading extends RecommendedRestaurantState {}

class RecommendedRestaurantLoaded extends RecommendedRestaurantState {
  final List<RecommendedRestaurant> restaurants;

  RecommendedRestaurantLoaded(this.restaurants);
}

class RecommendedRestaurantError extends RecommendedRestaurantState {
  RecommendedRestaurantError();
}
