import 'package:bloc/bloc.dart';
import 'package:zomato_partial_clone/api_services/recommended_restaurant_service.dart';
import 'package:zomato_partial_clone/core/base_bloc/base_bloc.dart';
import 'package:zomato_partial_clone/models/recommended_restaurant.dart';

part 'recommended_restaurant_event.dart';
part 'recommended_restaurant_state.dart';

class RecommendedRestaurantBloc
    extends BaseBloc<RecommendedRestaurantEvent, RecommendedRestaurantState> {
  final RecommendedRestaurantService recommendedRestaurantService =
      RecommendedRestaurantService();

  RecommendedRestaurantBloc() : super(RecommendedRestaurantInitial()) {
    on<FetchRecommendedRestaurants>(fetchRecommendedRestaurants);
  }

  Future<void> fetchRecommendedRestaurants(FetchRecommendedRestaurants event,
      Emitter<RecommendedRestaurantState> emit) async {
    emit(RecommendedRestaurantLoading());

    try {
      final restaurants =
          await recommendedRestaurantService.fetchRecommendedRestaurants();

      emit(RecommendedRestaurantLoaded(restaurants));
    } catch (e) {
      emit(RecommendedRestaurantError("Error fetching data: $e"));
    }
  }
}
