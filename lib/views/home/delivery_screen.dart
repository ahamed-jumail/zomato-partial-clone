import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zomato_partial_clone/bloc/app_bloc/restaurant_item_bloc/restaurant_item_bloc.dart';
import 'package:zomato_partial_clone/views/widgets/build_for_filter_widget.dart';
import 'package:zomato_partial_clone/views/widgets/build_for_recepie_item_widget.dart';
import 'package:zomato_partial_clone/views/widgets/build_for_recommended_restaurant_widget.dart';
import 'package:zomato_partial_clone/views/widgets/build_for_restaurant_item_widget.dart';
import 'package:zomato_partial_clone/views/widgets/bottom_navigation_bar_widget.dart';
import 'package:zomato_partial_clone/views/widgets/custom_divider_widget.dart';
import 'package:zomato_partial_clone/views/widgets/explore_widget.dart';
import 'package:zomato_partial_clone/views/widgets/search_bar_widget.dart';
import 'package:zomato_partial_clone/views/widgets/tab_bar_for_delivery_screen.dart';
import 'package:zomato_partial_clone/views/widgets/top_bar_widget.dart';
import 'package:zomato_partial_clone/views/widgets/veg_mode_widget.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class DeliveryScreen extends StatefulWidget {
  const DeliveryScreen({super.key});

  @override
  DeliveryScreenState createState() => DeliveryScreenState();
}

class DeliveryScreenState extends State<DeliveryScreen> {
  final searchController = TextEditingController();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LazyLoadScrollView(
        onEndOfPage: () {
          print("Hi");
          context.read<RestaurantItemBloc>().add(FetchMoreRestaurantItems());
        },
        child: CustomScrollView(
          slivers: [
            TopBarWidget(),
            SliverAppBar(
              backgroundColor: Colors.white,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SearchBarWidget(
                      leading: Icons.search_rounded,
                      hint: "Restaurant name or a dish...",
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  VegModeToggle(),
                ],
              ),
              automaticallyImplyLeading: false,
              pinned: true,
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Padding(
                  padding: EdgeInsets.only(top: 5.h),
                  child: Column(
                    children: [
                      TabBarForDeliveryScreen(),
                      BuildForRecommendedRestaurantWidget(),
                      CustomDividerWidget(centerText: "EXPLORE"),
                      ExploreWidget(),
                      CustomDividerWidget(centerText: "WHAT'S IN YOUR MIND"),
                      BuildForRecepieItemWidget(),
                    ],
                  ),
                ),
                CustomDividerWidget(centerText: "ALL RESTAURANTS"),
              ]),
            ),
            BuildForFilterWidget(),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Center(
                    child: Text(
                      "214 restaurants delivering to you",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          color: Color(0xff9ea3b0)),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Center(
                    child: Text(
                      "FEATURED",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                          color: Color(0xff9ea3b0)),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            ),
            BuildForRestaurantItemWidget(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        selectedIndex: selectedIndex,
        onTabSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
