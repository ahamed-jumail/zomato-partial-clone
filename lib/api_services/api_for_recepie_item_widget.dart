import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:zomato_partial_clone/views/widgets/recepie_item_widget.dart';

class ApiForRecepieItemWidget extends StatefulWidget {
  const ApiForRecepieItemWidget({super.key});
  @override
  ApiForRecepieItemWidgetState createState() => ApiForRecepieItemWidgetState();
}

class ApiForRecepieItemWidgetState extends State<ApiForRecepieItemWidget> {
  late List<Map<String, dynamic>> recepies;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchRecommendedRestaurants();
  }

  Future<void> fetchRecommendedRestaurants() async {
    try {
      final response = await Dio().get(
          'https://crudcrud.com/api/fcb8b14ef2f5434381ab6f4e21396ef2/appData');

      if (response.statusCode == 200) {
        setState(() {
          isLoading = false;
          final data = response.data[0];
          final recommendedData = data['data_for_RecepieItemWidget'];

          recepies = List<Map<String, dynamic>>.from(recommendedData.values);
        });
      } else {
        throw Exception('Failed to load recommended restaurants');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print("Error fetching data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 235,
      padding: EdgeInsets.symmetric(vertical: 20),
      child: isLoading
          ? Center(child: CircularProgressIndicator())
          : recepies.isEmpty
              ? Center(child: Text('No recepies found'))
              : ListView.builder(
                  padding: EdgeInsets.only(right: 15),
                  itemCount: recepies.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final recepie = recepies[index];
                    final recepie2 = recepies[9 - index];
                    return Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Column(
                        children: [
                          RecepieItemWidget(
                              recepieName: recepie["recepieName"],
                              recepieImage: recepie["recepieImageUrl"]),
                          SizedBox(
                            height: 15,
                          ),
                          RecepieItemWidget(
                              recepieName: recepie2["recepieName"],
                              recepieImage: recepie2["recepieImageUrl"])
                        ],
                      ),
                    );
                  },
                ),
    );
  }
}
