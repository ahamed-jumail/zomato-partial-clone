import 'package:dio/dio.dart';
import 'package:zomato_partial_clone/models/restaurant_item.dart';

class RestaurantItemService {
  final Dio dio = Dio();

  Future<List<RestaurantItem>> fetchRestaurantItems(
      {required int page, int limit = 2}) async {
    try {
      final response = await dio.get(
        "https://crudcrud.com/api/f723d768ef3345cdb0d070b351a8dd6f/appData",
        queryParameters: {'page': page, 'limit': limit},
      );

      if (response.statusCode == 200) {
        final data = response.data[0];
        final recommendedData = data['data_for_RestaurantItemWidget'];

        return RestaurantItem.fromJsonList(recommendedData.values.toList());
      } else {
        throw Exception('Failed to load recommended restaurants');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }
}
