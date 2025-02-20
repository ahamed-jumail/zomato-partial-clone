import 'package:dio/dio.dart';
import 'package:zomato_partial_clone/core/api_repository/api_repository.dart';
import 'package:zomato_partial_clone/models/restaurant_item.dart';

class RestaurantItemService extends ApiRepository {
  Future<List<RestaurantItem>> fetchRestaurantItems() async {
    final Response<dynamic> response = await ApiRepository.apiClient.get("/");

    final data = response.data[0];
    final recommendedData = data['data_for_RestaurantItemWidget'];

    return RestaurantItem.fromJsonList(recommendedData.values.toList());
  }
}
