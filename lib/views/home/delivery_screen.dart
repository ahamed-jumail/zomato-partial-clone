import 'package:flutter/material.dart';
import 'package:zomato_partial_clone/api_services/api_for_recepie_item_widget.dart';
import 'package:zomato_partial_clone/api_services/api_for_recommended_restaurant_widget.dart';
import 'package:zomato_partial_clone/api_services/api_for_restaurant_item_widget.dart';
import 'package:zomato_partial_clone/views/widgets/bottom_navigation_bar_widget.dart';
import 'package:zomato_partial_clone/views/widgets/filter_widget.dart';
import 'package:zomato_partial_clone/views/widgets/search_bar_widget.dart';
import 'package:zomato_partial_clone/views/widgets/tab_bar_for_delivery_screen.dart';

class DeliveryScreen extends StatefulWidget {
  const DeliveryScreen({super.key});

  @override
  DeliveryScreenState createState() => DeliveryScreenState();
}

class DeliveryScreenState extends State<DeliveryScreen> {
  var location = "Chennai";
  final searchController = TextEditingController();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: PreferredSize(
                preferredSize: const Size.fromHeight(55),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            Icon(
                              Icons.location_on_rounded,
                              color: Colors.red,
                              size: 32,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 4),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                      text: TextSpan(
                                    children: [
                                      TextSpan(
                                          text: location,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w800,
                                              fontSize: 18,
                                              color: Color(0xff1c1c1c))),
                                      WidgetSpan(
                                          child: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: Colors.black,
                                      ))
                                    ],
                                  )),
                                  Text(
                                    "Gent's Hostel 4, SSN College of Eng...",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13,
                                        color: Colors.grey),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        splashColor: Color(0xffe6e9ef),
                        child: Container(
                          height: 30,
                          width: 50,
                          padding: EdgeInsets.symmetric(vertical: 5)
                              .copyWith(right: 2, left: 1),
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.fromBorderSide(BorderSide(
                                  color: Color(0xffb8b9bf), width: 1)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Image.asset(
                            "icons/join_gold_logo.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      CircleAvatar(
                        radius: 19,
                        foregroundColor: const Color.fromARGB(255, 23, 89, 204),
                        backgroundColor:
                            const Color.fromARGB(255, 178, 201, 236),
                        child: Text("A"),
                      )
                    ],
                  ),
                )),
          ),
          SliverAppBar(
            title: SearchBarWidget(
              leading: Icons.search_rounded,
              hint: "Restaurant name or a dish...",
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
                  ApiForRecommendedRestaurantWidget(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                          height: 1,
                          color: Color(0xffe6e9ef),
                        )),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 1),
                            child: Text(
                              "WHAT'S ON YOUR MIND?",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Color(0xff586377),
                                  letterSpacing: 1.5),
                            )),
                        Expanded(
                            child: Container(
                          height: 1,
                          color: Color(0xffe6e9ef),
                        )),
                      ],
                    ),
                  ),
                  ApiForRecepieItemWidget(),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    height: 1,
                    color: Color(0xffe6e9ef),
                  )),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8)
                          .copyWith(bottom: 10),
                      child: Text(
                        "ALL RESTAURANTS",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Color(0xff9ea3b0),
                            letterSpacing: 1.5),
                      )),
                  Expanded(
                      child: Container(
                    height: 1,
                    color: Color(0xffe6e9ef),
                  )),
                ],
              ),
            ),
          ])),
          SliverAppBar(
            automaticallyImplyLeading: false,
            title: Container(
              height: 50,
              margin: EdgeInsets.symmetric(vertical: 14),
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.only(right: 1),
                scrollDirection: Axis.horizontal,
                children: [
                  FilterWidget(
                    tag: "Sort",
                    icon: "assets/images/filter_icon.png",
                    hasMultipleOption: true,
                  ),
                  FilterWidget(tag: "Nearest"),
                  FilterWidget(tag: "Rating 4.0+"),
                  FilterWidget(tag: "Pure Veg"),
                  FilterWidget(tag: "New Arrivals"),
                  FilterWidget(
                    tag: "Cuisines",
                    hasMultipleOption: true,
                  ),
                ],
              ),
            ),
            backgroundColor: Colors.white,
            elevation: 0,
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Center(
                  child: Text(
                    "214 reataurants delivering to you",
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
          ApiForRestaurantItemWidget(),
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
