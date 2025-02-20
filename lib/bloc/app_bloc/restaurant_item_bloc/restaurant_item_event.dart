part of 'restaurant_item_bloc.dart';

abstract class RestaurantItemEvent {}

class FetchRestaurantItems extends RestaurantItemEvent {}

class FetchMoreRestaurantItems extends RestaurantItemEvent {}

class FilterRestaurantItemsEvent extends RestaurantItemEvent {}

class UnFilterRestaurantItemsEvent extends RestaurantItemEvent {}
