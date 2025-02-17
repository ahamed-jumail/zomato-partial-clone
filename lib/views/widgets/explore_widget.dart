import 'package:flutter/material.dart';

class ExploreWidget extends StatelessWidget {
  const ExploreWidget({super.key});

  Widget actionTile(String imagePath, String label1, String label2) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              Image.asset(
                imagePath,
                height: 50,
                width: 50,
              ),
              SizedBox(
                height: 8,
              ),
              Column(
                spacing: 0,
                children: [
                  Text(
                    label1,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    label2,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          actionTile("assets/images/explore_offer.jpeg", "Offers", ""),
          actionTile("assets/images/explore_party.jpeg", "Plan", "a party"),
          actionTile("assets/images/explore_train.jpeg", "Food", "on Train"),
          actionTile("assets/images/explore_card.jpeg", "Gift", "Cards")
        ],
      ),
    );
  }
}
