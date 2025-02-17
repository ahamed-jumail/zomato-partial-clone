import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) =>
              true; // Bypass certificate validation
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  // Method to post data using Dio
  Future<void> postData() async {
    Dio dio = Dio();

    // Load the JSON data (you can also load it from an actual file)
    String jsonData = '''{
    "data_for_RecommendedRestaurantWidget": {
        "data1": {
            "restaurantName": "The Burger Joint",
            "deliveryTime": "30",
            "diatance": 2.5,
            "imageUrl": "https://img.freepik.com/free-photo/double-hamburger-isolated-white-background-fresh-burger-fast-food-with-beef-cream-cheese_90220-1192.jpg?w=2000",
            "offerApplicable": "FLAT 50% off"
        },
        "data2": {
            "restaurantName": "Tandoor Palace",
            "deliveryTime": "45",
            "diatance": 3.2,
            "imageUrl": "https://recipesblob.oetker.in/assets/6c0ac2f3ce204d3d9bb1df9709fc06c9/636x380/shahi-paneer.jpg",
            "offerApplicable": "FLAT 50% off"
        },
        "data3": {
            "restaurantName": "Sushi Rolls",
            "deliveryTime": "25",
            "diatance": 1.8,
            "imageUrl": "https://images.pexels.com/photos/5560763/pexels-photo-5560763.jpeg?cs=srgb&dl=pexels-saveurs-secretes-5560763.jpg&fm=jpg",
            "offerApplicable": "FLAT 50% off"
        },
        "data4": {
            "restaurantName": "Pasta Fresca",
            "deliveryTime": "30",
            "diatance": 2.7,
            "imageUrl": "https://images.pexels.com/photos/5560763/pexels-photo-5560763.jpeg?cs=srgb&dl=pexels-saveurs-secretes-5560763.jpg&fm=jpg",
            "offerApplicable": "FLAT 50% off"
        },
        "data5": {
            "restaurantName": "Grill Master",
            "deliveryTime": "40",
            "diatance": 4.0,
            "imageUrl": "https://img.freepik.com/free-photo/double-hamburger-isolated-white-background-fresh-burger-fast-food-with-beef-cream-cheese_90220-1192.jpg?w=2000",
            "offerApplicable": "FLAT 50% off"
        },
        "data6": {
            "restaurantName": "Curry House",
            "deliveryTime": "50",
            "diatance": 5.5,
            "imageUrl": "https://recipesblob.oetker.in/assets/6c0ac2f3ce204d3d9bb1df9709fc06c9/636x380/shahi-paneer.jpg",
            "offerApplicable": "FLAT 50% off"
        },
        "data7": {
            "restaurantName": "Pizza Delight",
            "deliveryTime": "35",
            "diatance": 3.0,
            "imageUrl": "https://images.pexels.com/photos/5560763/pexels-photo-5560763.jpeg?cs=srgb&dl=pexels-saveurs-secretes-5560763.jpg&fm=jpg",
            "offerApplicable": "FLAT 50% off"
        },
        "data8": {
            "restaurantName": "Vegan Vibes",
            "deliveryTime": "30",
            "diatance": 2.0,
            "imageUrl": "https://img.freepik.com/free-photo/double-hamburger-isolated-white-background-fresh-burger-fast-food-with-beef-cream-cheese_90220-1192.jpg?w=2000",
            "offerApplicable": "FLAT 50% off"
        },
        "data9": {
            "restaurantName": "Dim Sum Delight",
            "deliveryTime": "40",
            "diatance": 4.2,
            "imageUrl": "https://recipesblob.oetker.in/assets/6c0ac2f3ce204d3d9bb1df9709fc06c9/636x380/shahi-paneer.jpg",
            "offerApplicable": "FLAT 50% off"
        },
        "data10": {
            "restaurantName": "Poke Bowl",
            "deliveryTime": "30",
            "diatance": 2.3,
            "imageUrl": "https://images.pexels.com/photos/5560763/pexels-photo-5560763.jpeg?cs=srgb&dl=pexels-saveurs-secretes-5560763.jpg&fm=jpg",
            "offerApplicable": "FLAT 50% off"
        }
    },
    "data_for_RecepieItemWidget": {
        "data1": {
            "recepieName": "Spaghetti Carbonara",
            "recepieImageUrl": "assets/images/biryani_icon.png"
        },
        "data2": {
            "recepieName": "Butter Chicken",
            "recepieImageUrl": "assets/images/fried_rice.png"
        },
        "data3": {
            "recepieName": "Cheeseburger",
            "recepieImageUrl": "assets/images/biryani_icon.png"
        },
        "data4": {
            "recepieName": "Shahi Paneer",
            "recepieImageUrl": "assets/images/fried_rice.png"
        },
        "data5": {
            "recepieName": "Vegetable Biryani",
            "recepieImageUrl": "assets/images/biryani_icon.png"
        },
        "data6": {
            "recepieName": "Chicken Tikka",
            "recepieImageUrl": "assets/images/fried_rice.png"
        },
        "data7": {
            "recepieName": "Pasta Alfredo",
            "recepieImageUrl": "assets/images/biryani_icon.png"
        },
        "data8": {
            "recepieName": "Dim Sum",
            "recepieImageUrl": "assets/images/fried_rice.png"
        },
        "data9": {
            "recepieName": "Chicken Shawarma",
            "recepieImageUrl": "assets/images/biryani_icon.png"
        },
        "data10": {
            "recepieName": "Margherita Pizza",
            "recepieImageUrl": "assets/images/fried_rice.png"
        }
    },
    "data_for_RestaurantItemWidget": {
        "data1": {
            "imageUrl": "https://img.freepik.com/free-photo/double-hamburger-isolated-white-background-fresh-burger-fast-food-with-beef-cream-cheese_90220-1192.jpg?w=2000",
            "restaurantName": "The Burger Joint",
            "rating": 4.5,
            "speciality": "Burgers",
            "foodType": "Fast Food",
            "lowestPrice": 5.99,
            "deliveryTime": "30",
            "distance": 2.5,
            "discount": "10% off",
            "offerApplicable": "FLAT 50% off"
        },
        "data2": {
            "imageUrl": "https://recipesblob.oetker.in/assets/6c0ac2f3ce204d3d9bb1df9709fc06c9/636x380/shahi-paneer.jpg",
            "restaurantName": "Tandoor Palace",
            "rating": 4.7,
            "speciality": "North Indian",
            "foodType": "Indian",
            "lowestPrice": 12.99,
            "deliveryTime": "45",
            "distance": 3.2,
            "discount": "15% off",
            "offerApplicable": "FLAT 50% off"
        },
        "data3": {
            "imageUrl": "https://images.pexels.com/photos/5560763/pexels-photo-5560763.jpeg?cs=srgb&dl=pexels-saveurs-secretes-5560763.jpg&fm=jpg",
            "restaurantName": "Sushi Rolls",
            "rating": 4.8,
            "speciality": "Sushi",
            "foodType": "Japanese",
            "lowestPrice": 18.99,
            "deliveryTime": "25",
            "distance": 1.8,
            "discount": "10% off",
            "offerApplicable": "FLAT 50% off"
        },
        "data4": {
            "imageUrl": "https://images.pexels.com/photos/5560763/pexels-photo-5560763.jpeg?cs=srgb&dl=pexels-saveurs-secretes-5560763.jpg&fm=jpg",
            "restaurantName": "Pasta Fresca",
            "rating": 4.3,
            "speciality": "Pasta",
            "foodType": "Italian",
            "lowestPrice": 8.99,
            "deliveryTime": "30",
            "distance": 2.7,
            "discount": "20% off",
            "offerApplicable": "FLAT 50% off"
        },
        "data5": {
            "imageUrl": "https://img.freepik.com/free-photo/double-hamburger-isolated-white-background-fresh-burger-fast-food-with-beef-cream-cheese_90220-1192.jpg?w=2000",
            "restaurantName": "Grill Master",
            "rating": 4.6,
            "speciality": "Grilled Foods",
            "foodType": "BBQ",
            "lowestPrice": 10.99,
            "deliveryTime": "40",
            "distance": 4.0,
            "discount": "10% off",
            "offerApplicable": "FLAT 50% off"
        },
        "data6": {
            "imageUrl": "https://recipesblob.oetker.in/assets/6c0ac2f3ce204d3d9bb1df9709fc06c9/636x380/shahi-paneer.jpg",
            "restaurantName": "Curry House",
            "rating": 4.7,
            "speciality": "Curry",
            "foodType": "Indian",
            "lowestPrice": 14.99,
            "deliveryTime": "50",
            "distance": 5.5,
            "discount": "20% off",
            "offerApplicable": "FLAT 50% off"
        },
        "data7": {
            "imageUrl": "https://images.pexels.com/photos/5560763/pexels-photo-5560763.jpeg?cs=srgb&dl=pexels-saveurs-secretes-5560763.jpg&fm=jpg",
            "restaurantName": "Pizza Delight",
            "rating": 4.4,
            "speciality": "Pizza",
            "foodType": "Italian",
            "lowestPrice": 11.99,
            "deliveryTime": "35",
            "distance": 3.0,
            "discount": "15% off",
            "offerApplicable": "FLAT 50% off"
        },
        "data8": {
            "imageUrl": "https://images.pexels.com/photos/5560763/pexels-photo-5560763.jpeg?cs=srgb&dl=pexels-saveurs-secretes-5560763.jpg&fm=jpg",
            "restaurantName": "Vegan Vibes",
            "rating": 4.9,
            "speciality": "Vegan",
            "foodType": "Vegan",
            "lowestPrice": 9.99,
            "deliveryTime": "30",
            "distance": 2.0,
            "discount": "5% off",
            "offerApplicable": "FLAT 50% off"
        },
        "data9": {
            "imageUrl": "https://img.freepik.com/free-photo/double-hamburger-isolated-white-background-fresh-burger-fast-food-with-beef-cream-cheese_90220-1192.jpg?w=2000",
            "restaurantName": "Dim Sum Delight",
            "rating": 4.2,
            "speciality": "Dim Sum",
            "foodType": "Chinese",
            "lowestPrice": 6.99,
            "deliveryTime": "40",
            "distance": 4.2,
            "discount": "10% off",
            "offerApplicable": "FLAT 50% off"
        },
        "data10": {
            "imageUrl": "https://recipesblob.oetker.in/assets/6c0ac2f3ce204d3d9bb1df9709fc06c9/636x380/shahi-paneer.jpg",
            "restaurantName": "Poke Bowl",
            "rating": 4.0,
            "speciality": "Poke Bowl",
            "foodType": "Hawaiian",
            "lowestPrice": 7.99,
            "deliveryTime": "30",
            "distance": 2.3,
            "discount": "10% off",
            "offerApplicable": "FLAT 50% off"
        }
    }
}
''';

    // The URL where you want to send the POST request
    String url =
        "https://crudcrud.com/api/fcb8b14ef2f5434381ab6f4e21396ef2/appData";

    try {
      // Send POST request to the API with JSON data
      Response response = await dio.post(url, data: json.decode(jsonData));

      // Check if the request was successful
      if (response.statusCode == 201) {
        print('Data posted successfully');
      } else {
        print('Failed to post data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: postData,
          child: Text('Post Data'),
        ),
      ),
    );
  }
}
