import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zomato_partial_clone/bloc/app_bloc/recepie_item_bloc/recepie_item_bloc.dart';
import 'package:zomato_partial_clone/bloc/app_bloc/recommended_restaurant_bloc/recommended_restaurant_bloc.dart';
import 'package:zomato_partial_clone/bloc/app_bloc/restaurant_item_bloc/restaurant_item_bloc.dart';
import 'package:zomato_partial_clone/views/home/delivery_screen.dart';
import 'dart:io';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<RecommendedRestaurantBloc>(
            create: (BuildContext context) => RecommendedRestaurantBloc()),
        BlocProvider<RecepieItemBloc>(
          create: (BuildContext context) => RecepieItemBloc(),
        ),
        BlocProvider<RestaurantItemBloc>(
            create: (BuildContext context) => RestaurantItemBloc()),
      ],
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 835),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "custom_font_regular",
        ),
        home: DeliveryScreen(),
      ),
    );
  }
}
