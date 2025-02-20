import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:zomato_partial_clone/api_services/recommended_restaurant_service.dart';
import 'package:zomato_partial_clone/models/recommended_restaurant.dart';
import '../../core/base_bloc/base_bloc.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends BaseBloc<AppEvent, AppState> {
  AppBloc() : super(RecommendedRestaurantInitial());

  StateData stateData = StateData();
  final RecommendedRestaurantService recommendedRestaurantService =
      RecommendedRestaurantService();

  Future<void> fetchRecommendedRestaurants(
      FetchRecommendedRestaurants event, Emitter<AppState> emit) async {
    emit(RecommendedRestaurantLoading());

    try {
      final restaurants =
          await recommendedRestaurantService.fetchRecommendedRestaurants();

      emit(RecommendedRestaurantLoaded(restaurants));
    } catch (e) {
      emit(RecommendedRestaurantError());
    }
  }

  @override
  Future<void> eventHandlerMethod(
      AppEvent event, Emitter<AppState> emit) async {
    switch (event.runtimeType) {
      case const (FetchRecommendedRestaurants):
        return fetchRecommendedRestaurants(
            event as FetchRecommendedRestaurants, emit);
    }
  }

  @override
  AppState getErrorState() {
    return RecommendedRestaurantError();
  }
}
