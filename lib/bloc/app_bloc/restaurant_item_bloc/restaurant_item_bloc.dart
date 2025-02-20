import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zomato_partial_clone/api_services/restaurant_item_service.dart';
import 'package:zomato_partial_clone/core/base_bloc/base_bloc.dart';
import 'package:zomato_partial_clone/models/restaurant_item.dart';

part 'restaurant_item_event.dart';
part 'restaurant_item_state.dart';

class RestaurantItemBloc
    extends BaseBloc<RestaurantItemEvent, RestaurantItemState> {
  RestaurantItemBloc() : super(RestaurantItemInitial());

  late final List<RestaurantItem> restaurants;

  final RestaurantItemService recepieItemService = RestaurantItemService();

  Future<void> fetchRestaurantItems(
      FetchRestaurantItems event, Emitter<RestaurantItemState> emit) async {
    emit(RestaurantItemLoading());

    restaurants = await recepieItemService.fetchRestaurantItems();

    emit(RestaurantItemLoaded(restaurants));
  }

  Future<void> fetchMoreRestaurantItems(
      FetchMoreRestaurantItems event, Emitter<RestaurantItemState> emit) async {
    if (state is RestaurantItemLoading) return;
    emit(RestaurantItemLoading());
    final List<RestaurantItem> moreRestaurants =
        await recepieItemService.fetchRestaurantItems();
    restaurants.addAll(moreRestaurants);

    emit(RestaurantItemLoaded(restaurants));
  }

  Future<void> filterRestaurantItems(FilterRestaurantItemsEvent event,
      Emitter<RestaurantItemState> emit) async {
    final restaurantsFiltered = restaurants
        .where((RestaurantItem restaurant) => restaurant.rating >= 4.0)
        .toList();
    emit(RestaurantItemLoaded(restaurantsFiltered));
  }

  Future<void> unFilterRestaurantItems(UnFilterRestaurantItemsEvent event,
      Emitter<RestaurantItemState> emit) async {
    final restaurantsFiltered = restaurants;
    emit(RestaurantItemLoaded(restaurantsFiltered));
  }

  @override
  Future<void> eventHandlerMethod(
      RestaurantItemEvent event, Emitter<RestaurantItemState> emit) async {
    switch (event.runtimeType) {
      case const (FetchRestaurantItems):
        return fetchRestaurantItems(event as FetchRestaurantItems, emit);
      case const (FetchMoreRestaurantItems):
        return fetchMoreRestaurantItems(
            event as FetchMoreRestaurantItems, emit);
      case const (FilterRestaurantItemsEvent):
        return filterRestaurantItems(event as FilterRestaurantItemsEvent, emit);
      case const (UnFilterRestaurantItemsEvent):
        return unFilterRestaurantItems(
            event as UnFilterRestaurantItemsEvent, emit);
    }
  }

  @override
  RestaurantItemState getErrorState() {
    return RestaurantItemError();
  }
}
