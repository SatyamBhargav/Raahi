import 'package:flutter/material.dart';
import 'package:raahi/screens/upcomingscreen.dart';
import 'package:raahi/screens/wishlistscreen.dart';

class MyTripScreen extends StatefulWidget {
  const MyTripScreen({super.key});

  @override
  State<MyTripScreen> createState() => _MyTripScreenState();
}

class _MyTripScreenState extends State<MyTripScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              const Text(
                'My Trip',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 10),
              Image.asset(
                'images/mytrip.png',
                height: 55,
              )
            ],
          ),
        ),
        body: Column(children: [
          Container(
            child: TabBar(
              indicatorColor: Color(0xff3da35d),
              dividerColor: Colors.white,
              labelColor: Color(0xff3da35d),
              labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              controller: tabController,
              tabs: const [
                Tab(text: 'Upcoming'),
                Tab(text: 'Wishlist'),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 300,
            child: TabBarView(
              controller: tabController,
              children: const [UpcomingScreen(), WishListScreen()],
            ),
          ),
        ]),
      ),
    );
  }
}
