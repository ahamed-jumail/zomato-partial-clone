import 'package:flutter/material.dart';
import 'package:zomato_partial_clone/views/widgets/offer_icon_widget.dart';

class DiscountWidget extends StatelessWidget {
  final String discount;
  final EdgeInsets padding;
  final double iconSize;
  final double textSize;

  const DiscountWidget({
    super.key,
    required this.discount,
    this.iconSize = 20,
    this.textSize = 15,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding == EdgeInsets.zero
          ? EdgeInsets.only(top: 8, bottom: 4)
          : padding,
      child: Row(
        children: [
          OfferIconWidget(iconSize: iconSize),
          SizedBox(width: 5),
          Text(
            discount,
            style: TextStyle(fontSize: textSize, color: Color(0xff1c1c1c)),
          )
        ],
      ),
    );
  }
}
