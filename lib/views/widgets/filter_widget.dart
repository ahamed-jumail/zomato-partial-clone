import 'package:flutter/material.dart';

class FilterWidget extends StatelessWidget {
  final String tag;
  final String? icon;
  final bool hasMultipleOption;

  const FilterWidget({
    super.key,
    required this.tag,
    this.icon,
    this.hasMultipleOption = false,
  });

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
            onTap: () {},
            child: Container(
              height: 34,
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Color(0xffe8e9ec)),
              ),
              child: Row(
                children: [
                  if (icon != null)
                    Padding(
                      padding: EdgeInsets.only(right: 4),
                      child: Image.asset(
                        icon!,
                        color: Colors.black,
                        height: 15,
                        width: 15,
                      ),
                    ),
                  Text(
                    tag,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0,
                        fontSize: 14,
                        color: Color(0xff1c1c1c)),
                  ),
                  if (hasMultipleOption)
                    Icon(
                      Icons.arrow_drop_down,
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
