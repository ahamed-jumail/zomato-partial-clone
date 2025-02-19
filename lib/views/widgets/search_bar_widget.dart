import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final String? hint;
  final Color? hintColor;
  final TextEditingController? controller;
  final IconData? leading;
  final bool? isChangingHint;
  final String? hintType;

  const SearchBarWidget({
    super.key,
    this.hint,
    this.hintColor,
    this.controller,
    this.leading,
    this.isChangingHint,
    this.hintType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        border: Border.fromBorderSide(
          BorderSide(color: Color.fromARGB(255, 215, 220, 230), width: 1),
        ),
      ),
      margin: EdgeInsets.only(top: 15, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(
              leading,
              color: Colors.redAccent,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: hintColor,
                  ),
                  border: InputBorder.none,
                ),
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
                onTap: () {},
              ),
            ),
          ),
          Container(
            width: 1,
            height: 25,
            padding: EdgeInsets.symmetric(vertical: 2),
            color: Color.fromARGB(255, 215, 220, 230),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(
              Icons.mic_none,
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}
