part of 'restaurant_item_bloc.dart';

abstract class RestaurantItemEvent extends BaseEvent {}

class FetchRestaurantItems extends RestaurantItemEvent {
  final bool isLoadMore;
  FetchRestaurantItems({this.isLoadMore = false});
}

class FilterRestaurantItemsEvent extends RestaurantItemEvent {}

class UnFilterRestaurantItemsEvent extends RestaurantItemEvent {}
