import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int selectedIndex; // Track the selected index
  final Function(int) onTabSelected; // Callback to handle tab selection

  const BottomNavigationBarWidget({
    super.key,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  Widget bottomNavigationBarItem({
    required String imageIcon,
    required String label,
    required bool isSelected,
    required Function() onTap,
  }) =>
      Expanded(
        child: GestureDetector(
          onTap: onTap, // Handle tab selection
          child: Container(
            color: Colors.white,
            width: double.infinity,
            height: 56,
            margin: EdgeInsets.only(bottom: 2),
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Container(
                  width: 100,
                  height: 3, // Height of the indicator
                  color: isSelected ? Colors.redAccent : Colors.transparent,
                ),
                Spacer(),
                Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        imageIcon,
                        height: 20,
                        width: 20,
                        color: isSelected ? Colors.redAccent : Colors.grey,
                      ),
                      SizedBox(width: 10),
                      Text(
                        label,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff1c1c1c),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      padding: EdgeInsets.zero,
      elevation: 0,
      height: 58,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          bottomNavigationBarItem(
            imageIcon: "assets/images/delivery_selected_icon.png",
            label: "Delivery",
            isSelected: selectedIndex == 0, // Compare with selectedIndex
            onTap: () => onTabSelected(0), // Set selected index when tapped
          ),
          SizedBox(
            height: 30,
            child: VerticalDivider(color: Colors.grey),
          ),
          bottomNavigationBarItem(
            imageIcon: "assets/images/food-tray.png",
            label: "Dining",
            isSelected: selectedIndex == 1, // Compare with selectedIndex
            onTap: () => onTabSelected(1), // Set selected index when tapped
          ),
        ],
      ),
    );
  }
}
