import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:zomato_partial_clone/api_services/recommended_restaurant_service.dart';
import 'package:zomato_partial_clone/core/base_bloc/base_bloc.dart';
import 'package:zomato_partial_clone/models/recommended_restaurant.dart';

part 'recommended_restaurant_event.dart';
part 'recommended_restaurant_state.dart';

class RecommendedRestaurantBloc extends BaseBloc<RecommendedRestaurantEvent, RecommendedRestaurantState> {
  RecommendedRestaurantBloc() : super(RecommendedRestaurantInitial());

  final RecommendedRestaurantService recommendedRestaurantService =
      RecommendedRestaurantService();

  Future<void> fetchRecommendedRestaurants(
      FetchRecommendedRestaurants event, Emitter<RecommendedRestaurantState> emit) async {
    emit(RecommendedRestaurantLoading());

    final restaurants =
        await recommendedRestaurantService.fetchRecommendedRestaurants();

    emit(RecommendedRestaurantLoaded(restaurants));
  }

  @override
  Future<void> eventHandlerMethod(
      RecommendedRestaurantEvent event, Emitter<RecommendedRestaurantState> emit) async {
    switch (event.runtimeType) {
      case const (FetchRecommendedRestaurants):
        return fetchRecommendedRestaurants(
            event as FetchRecommendedRestaurants, emit);
    }
  }

  @override
  RecommendedRestaurantState getErrorState() {
    return RecommendedRestaurantError();
  }
}
