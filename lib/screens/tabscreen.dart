import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:raahi/screens/explorescreen.dart';
import 'package:raahi/screens/homescreen.dart';
import 'package:raahi/screens/profilescreen.dart';
import 'package:raahi/screens/mytripscreen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectScreen = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = const [
      HomeScreen(),
      ExploreScreen(),
      MyTripScreen(),
      ProfileScreen(),
    ];

    return Scaffold(
      body: widgetList[_selectScreen],
      bottomNavigationBar: GNav(
        onTabChange: (index) {
          setState(() {
            _selectScreen = index;
          });
        },
        gap: 8,
        tabs: const [
          GButton(
            icon: Iconsax.home,
            text: 'Home',
          ),
          GButton(
            icon: Iconsax.discover_1,
            text: 'Explore',
          ),
          GButton(
            icon: Iconsax.heart,
            text: 'My Trip',
          ),
          GButton(
            icon: Iconsax.user,
            text: 'Profile',
          )
        ],
      ),
    );
  }
}
