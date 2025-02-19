import 'package:flutter/material.dart';
import 'package:zomato_partial_clone/views/widgets/filter_widget.dart';
import 'package:zomato_partial_clone/views/widgets/filter_widget_for_rating.dart';

class BuildForFilterWidget extends StatelessWidget {
  const BuildForFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      title: Container(
        height: 50,
        margin: EdgeInsets.symmetric(vertical: 14),
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(right: 1),
          scrollDirection: Axis.horizontal,
          children: [
            FilterWidget(
              tag: "Sort",
              icon: "assets/images/filter_icon.png",
              hasMultipleOption: true,
            ),
            FilterWidgetForRating(
              tag: "Rating 4.0+",
            ),
            FilterWidget(tag: "Great Offers"),
            FilterWidget(tag: "Previously Ordered"),
            FilterWidget(tag: "Pure Veg"),
            FilterWidget(
              tag: "Cuisines",
              hasMultipleOption: true,
            ),
            FilterWidget(
              tag: "Schedule",
              hasMultipleOption: true,
            ),
          ],
        ),
      ),
      pinned: true,
    );
  }
}
