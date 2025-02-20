import 'package:dio/dio.dart';
import 'package:zomato_partial_clone/core/api_repository/api_repository.dart';
import 'package:zomato_partial_clone/models/recepie_item.dart';

class RecepieItemService extends ApiRepository {
  Future<List<RecepieItem>> fetchRecepieItems() async {
    final Response<dynamic> response = await ApiRepository.apiClient.get("/");

    final data = response.data[0];
    final recommendedData = data['data_for_RecepieItemWidget'];

    return RecepieItem.fromJsonList(recommendedData.values.toList());
  }
}
