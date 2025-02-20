part of 'app_bloc.dart';

abstract class AppState extends ErrorState {}

class StateData extends AppState {
  StateData({this.restaurants});

  RecommendedRestaurant? restaurants;
}

class RecommendedRestaurantInitial extends AppState {}

class RecommendedRestaurantLoading extends AppState {}

class RecommendedRestaurantLoaded extends AppState {
  final List<RecommendedRestaurant> restaurants;

  RecommendedRestaurantLoaded(this.restaurants);
}

class RecommendedRestaurantError extends AppState {
  RecommendedRestaurantError();
}
