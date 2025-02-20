part of 'restaurant_item_bloc.dart';

abstract class RestaurantItemState extends ErrorState {}

class RestaurantItemInitial extends RestaurantItemState {}

class RestaurantItemLoading extends RestaurantItemState {}

class RestaurantItemLoaded extends RestaurantItemState {
  final List<RestaurantItem> restaurants;
  RestaurantItemLoaded(this.restaurants);
}

class RestaurantItemError extends RestaurantItemState {}
