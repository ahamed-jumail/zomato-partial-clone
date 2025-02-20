import 'package:dio/dio.dart';
import 'package:zomato_partial_clone/core/api_repository/api_repository.dart';
import 'package:zomato_partial_clone/models/recommended_restaurant.dart';

class RecommendedRestaurantService extends ApiRepository {
  Future<List<RecommendedRestaurant>> fetchRecommendedRestaurants() async {
    final Response<dynamic> response = await ApiRepository.apiClient.get("/");

    final data = response.data[0];
    final recommendedData = data['data_for_RecommendedRestaurantWidget'];
    return RecommendedRestaurant.fromJsonList(recommendedData.values.toList());
  }
}
