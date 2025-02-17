import 'package:flutter/material.dart';

const midGrey = Color(0xffb8b9bf);

class CustomDashedDivider extends StatelessWidget {
  final Color color;
  final int size;

  const CustomDashedDivider({super.key, this.color = midGrey, this.size = 10});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
          1100 ~/ size,
          (index) => Expanded(
                child: Container(
                  color: index % 2 == 0 ? Colors.transparent : color,
                  height: 2,
                ),
              )),
    );
  }
}
