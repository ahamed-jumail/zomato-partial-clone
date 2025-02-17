import 'package:flutter/material.dart';

class TabBarForDeliveryScreen extends StatefulWidget {
  const TabBarForDeliveryScreen({super.key});

  @override
  State<TabBarForDeliveryScreen> createState() => TabBarForDeliveryScreenState();
}

class TabBarForDeliveryScreenState extends State<TabBarForDeliveryScreen>
    with SingleTickerProviderStateMixin {
  String tabSelected = "Recommended";
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {
        tabSelected = _tabController.index == 0 ? "Recommended" : "Collections";
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 303,
              height: 35,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white),
              child: TabBar(
                physics: NeverScrollableScrollPhysics(),
                controller: _tabController, 
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  border: Border.all(color: Colors.red, width: 1.25),
                  borderRadius: tabSelected == "Recommended"
                      ? BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10))
                      : BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                  color: Colors.red[50],
                ),
                labelColor: Colors.black,
                dividerColor: Colors.transparent,
                tabs: [
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Recommended"),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        tabSelected == "Collections"
                            ? Icon(
                                Icons.bookmark,
                                color: Colors.red,
                              )
                            : Icon(
                                Icons.bookmark_border_outlined,
                                color: Colors.red,
                              ),
                        Text("Collections"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
