import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class FilterWidgetForRating extends StatefulWidget {
  final String tag;
  final String? icon;
  final bool hasMultipleOption;

  const FilterWidgetForRating(
      {super.key,
      required this.tag,
      this.icon,
      this.hasMultipleOption = false});

  @override
  FilterWidgetForRatingState createState() => FilterWidgetForRatingState();
}

class FilterWidgetForRatingState extends State<FilterWidgetForRating> {
  bool? isRatingFilterActive;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchRatingFilterFlag();
  }

  Future<void> fetchRatingFilterFlag() async {
    try {
      final response = await Dio().get(
          'https://crudcrud.com/api/668670b8229a4d4ab8e0dd3a71cd51f0/appData');
      if (response.statusCode == 200) {
        setState(() {
          isLoading = false;
          final data = response.data[0];
          final ratingFilterFlag = data['flag_for_rating_filter'];
          isRatingFilterActive = ratingFilterFlag == 'true';
        });
      } else {
        throw Exception('Failed to load rating filter flag');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print("Error fetching rating filter flag: $e");
    }
  }

  Future<void> toggleRatingFilterFlag() async {
    if (isRatingFilterActive != null) {
      try {
        final newFlagValue = isRatingFilterActive! ? 'false' : 'true';

        await Dio().put(
          'https://crudcrud.com/api/b72b0995e5994e6683278e38411ce8a9/appData',
          data: {'flag_for_rating_filter': newFlagValue},
        );

        setState(() {
          isRatingFilterActive = !isRatingFilterActive!;
        });
      } catch (e) {
        print("Error updating rating filter flag: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      child: Center(
        child: Material(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          elevation: 1,
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: toggleRatingFilterFlag,
            child: Container(
              height: 34,
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Color(0xffe8e9ec)),
              ),
              child: Row(
                children: [
                  if (widget.icon != null)
                    Padding(
                      padding: EdgeInsets.only(right: 4),
                      child: Image.asset(
                        widget.icon!,
                        color: Colors.black,
                        height: 15,
                        width: 15,
                      ),
                    ),
                  Text(
                    widget.tag,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0,
                        fontSize: 14,
                        color: Color(0xff1c1c1c)),
                  ),
                  if (widget.hasMultipleOption)
                    Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black,
                      size: 16,
                    ),
                  if (isRatingFilterActive != null && isRatingFilterActive!)
                    Icon(
                      Icons.close,
                      color: Colors.black,
                      size: 16,
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
