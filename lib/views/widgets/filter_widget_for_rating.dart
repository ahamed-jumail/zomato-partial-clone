import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zomato_partial_clone/bloc/app_bloc/restaurant_item_bloc/restaurant_item_bloc.dart';

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
  bool isFiltered = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5, right: 8),
      child: Center(
        child: Material(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () {
              if (isFiltered) {
                context
                    .read<RestaurantItemBloc>()
                    .add(UnFilterRestaurantItemsEvent());
              } else {
                context
                    .read<RestaurantItemBloc>()
                    .add(FilterRestaurantItemsEvent());
              }
              setState(() {
                isFiltered = !isFiltered;
              });
            },
            child: Container(
              height: 34,
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
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
                        fontWeight: FontWeight.w700,
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
                  if (isFiltered)
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
