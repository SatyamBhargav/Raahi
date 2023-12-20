import 'package:flutter/material.dart';
import 'package:raahi/screens/explorescreen.dart';
import 'package:raahi/screens/homescreen.dart';
import 'package:raahi/screens/profilescreen.dart';

class TabBarViewScreen extends StatelessWidget {
  const TabBarViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            toolbarHeight: 0.2,
            bottom: TabBar(
              tabs: [
                Tab(text: 'Overview'),
                Tab(text: 'Overview2'),
                Tab(text: 'Overview3'),
              ],
            ),
          ),
          body: TabBarView(children: [
            HomeScreen(),
            ExploreScreen(),
            ProfileScreen(),
          ]),
        ));
  }
}
