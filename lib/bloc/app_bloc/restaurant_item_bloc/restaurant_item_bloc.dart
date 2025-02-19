import 'package:zomato_partial_clone/api_services/restaurant_item_service.dart';
import 'package:zomato_partial_clone/core/base_bloc/base_bloc.dart';
import 'package:zomato_partial_clone/models/restaurant_item.dart';

part 'restaurant_item_event.dart';
part 'restaurant_item_state.dart';

class RestaurantItemBloc
    extends BaseBloc<RestaurantItemEvent, RestaurantItemState> {
  final RestaurantItemService restaurantItemService = RestaurantItemService();
  late final List<RestaurantItem> restaurants;
  bool hasMoreData = true;
  int currentPage = 1;

  RestaurantItemBloc() : super(RestaurantItemInitial()) {
    on<FetchRestaurantItems>((event, emit) async {
      if (event.isLoadMore && !hasMoreData) return;

      if (event.isLoadMore) {
        emit(RestaurantItemLoadingMore(restaurants));
      } else {
        emit(RestaurantItemLoading());
      }

      try {
        final newRestaurants = await restaurantItemService.fetchRestaurantItems(
            page: currentPage, limit: 10);

        if (newRestaurants.isEmpty) {
          hasMoreData = false;
        } else {
          currentPage++;
        }

        if (event.isLoadMore) {
          restaurants.addAll(newRestaurants);
          emit(RestaurantItemLoaded(restaurants));
        } else {
          restaurants = newRestaurants;
          emit(RestaurantItemLoaded(restaurants));
        }
      } catch (e) {
        emit(RestaurantItemError("Error fetching data: $e"));
      }
    });

    on<FilterRestaurantItemsEvent>((event, emit) {
      final restaurantsFiltered = restaurants
          .where((RestaurantItem restaurant) => restaurant.rating >= 4.0)
          .toList();
      emit(RestaurantItemLoaded(restaurantsFiltered));
    });

    on<UnFilterRestaurantItemsEvent>((event, emit) {
      final restaurantsFiltered = restaurants;
      emit(RestaurantItemLoaded(restaurantsFiltered));
    });
  }
}
