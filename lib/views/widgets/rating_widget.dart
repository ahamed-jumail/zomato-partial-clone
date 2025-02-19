import 'package:flutter/material.dart';

class RatingWidget extends StatelessWidget {
  final double rating;

  const RatingWidget({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.5, vertical: 4),
      decoration: BoxDecoration(
        color: rating > 3
            ? Color(0xff257e3e)
            : rating > 2
                ? Color(0xfff2c418)
                : Color(0xFFe13742),
        borderRadius: BorderRadius.circular(7),
      ),
      alignment: Alignment.center,
      child: Row(
        children: [
          Text(
            rating.toStringAsFixed(1),
            style: TextStyle(
              fontSize: 12,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            width: 2,
          ),
          Icon(
            Icons.star,
            color: Colors.white,
            size: 14,
          ),
        ],
      ),
    );
  }
}
