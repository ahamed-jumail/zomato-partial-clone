import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

class DeliveryScreen extends StatefulWidget {
  const DeliveryScreen({super.key});

  @override
  DeliveryScreenState createState() => DeliveryScreenState();
}

class DeliveryScreenState extends State<DeliveryScreen> {
  var location = "Chennai";
  final searchController = TextEditingController();
  int selectedIndex = 0;
  bool isLoading = false;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(scrollListener);
    BlocProvider.of<RestaurantItemBloc>(context)
        .add(FetchRestaurantItems(isLoadMore: false));
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      if (!isLoading) {
        loadMoreData();
      }
    }
  }

  void loadMoreData() async {
    setState(() {
      isLoading = true;
    });

    final bloc = BlocProvider.of<RestaurantItemBloc>(context);
    bloc.add(FetchRestaurantItems(isLoadMore: true));

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          TopBarWidget(),
          SliverAppBar(
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
                  width: 10,
                ),
                VegModeToggle(),
              ],
            ),
            automaticallyImplyLeading: false,
            elevation: 0,
            pinned: true,
            forceElevated: false,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.only(top: 5),
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
                        fontSize: 14,
                        color: Color(0xff9ea3b0)),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    "FEATURED",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Color(0xff9ea3b0)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          BuildForRestaurantItemWidget(),
        ],
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
