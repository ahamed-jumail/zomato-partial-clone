import 'package:dio/dio.dart';
import 'package:zomato_partial_clone/models/recepie_item.dart';

class RecepieItemService {
  final Dio dio = Dio();

  Future<List<RecepieItem>> fetchRecepieItems() async {
    try {
      final response = await dio.get(
          "https://crudcrud.com/api/f723d768ef3345cdb0d070b351a8dd6f/appData");

      if (response.statusCode == 200) {
        final data = response.data[0];
        final recommendedData = data['data_for_RecepieItemWidget'];

        return RecepieItem.fromJsonList(recommendedData.values.toList());
      } else {
        throw Exception('Failed to load recepies');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }
}
