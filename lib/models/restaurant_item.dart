class RestaurantItem {
  final String imageUrl;
  final String restaurantName;
  final double rating;
  final String speciality;
  final String foodType;
  final double lowestPrice;
  final String deliveryTime;
  final double distance;

  RestaurantItem({
    required this.imageUrl,
    required this.restaurantName,
    required this.rating,
    required this.speciality,
    required this.foodType,
    required this.lowestPrice,
    required this.deliveryTime,
    required this.distance,
  });

  factory RestaurantItem.fromJson(Map<String, dynamic> json) {
    return RestaurantItem(
      imageUrl: json['imageUrl'] ?? '',
      restaurantName: json['restaurantName'] ?? '',
      rating: json['rating'] ?? 0,
      speciality: json['speciality'] ?? '',
      foodType: json['foodType'] ?? '',
      lowestPrice: json['lowestPrice'] ?? 0,
      deliveryTime: json['deliveryTime'] ?? '',
      distance: json['distance'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'imageUrl': imageUrl,
      'restaurantName': restaurantName,
      'rating': rating,
      'speciality': speciality,
      'foodType': foodType,
      'lowestPrice': lowestPrice,
      'deliveryTime': deliveryTime,
      'distance': distance,
    };
  }

  static List<RestaurantItem> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => RestaurantItem.fromJson(json)).toList();
  }
}
