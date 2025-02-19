class RecommendedRestaurant {
  final String imageUrl;
  final String offerApplicable;
  final String restaurantName;
  final String deliveryTime;
  final double distance;

  RecommendedRestaurant({
    required this.imageUrl,
    required this.offerApplicable,
    required this.restaurantName,
    required this.deliveryTime,
    required this.distance,
  });

  factory RecommendedRestaurant.fromJson(Map<String, dynamic> json) {
    return RecommendedRestaurant(
      imageUrl: json['imageUrl'] ?? '',
      offerApplicable: json['offerApplicable'] ?? false,
      restaurantName: json['restaurantName'] ?? '',
      deliveryTime: json['deliveryTime'] ?? '',
      distance: json['diatance'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'imageUrl': imageUrl,
      'offerApplicable': offerApplicable,
      'restaurantName': restaurantName,
      'deliveryTime': deliveryTime,
      'diatance': distance,
    };
  }

  static List<RecommendedRestaurant> fromJsonList(List<dynamic> jsonList) {
    return jsonList
        .map((json) => RecommendedRestaurant.fromJson(json))
        .toList();
  }
}
