part of 'restaurant_item_bloc.dart';

abstract class RestaurantItemState extends BaseState {}

class RestaurantItemInitial extends RestaurantItemState {}

class RestaurantItemLoading extends RestaurantItemState {}

class RestaurantItemLoadingMore extends RestaurantItemState {
  final List<RestaurantItem> restaurants;
  RestaurantItemLoadingMore(this.restaurants);
}

class RestaurantItemLoaded extends RestaurantItemState {
  final List<RestaurantItem> restaurants;
  RestaurantItemLoaded(this.restaurants);
}

class RestaurantItemError extends RestaurantItemState {
  final String error;
  RestaurantItemError(this.error);
}
