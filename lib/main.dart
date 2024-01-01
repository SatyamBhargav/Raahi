import 'package:flutter/material.dart';
import 'package:raahi/Api/eventapi.dart';
import 'package:raahi/Api/imageapi.dart';
import 'package:raahi/Api/overviewapi.dart';
import 'package:raahi/screens/destinationDetails.dart';
import 'package:raahi/screens/homescreen.dart';
import 'package:raahi/screens/loginscreen.dart';
import 'package:raahi/screens/profilescreen.dart';

import 'package:raahi/screens/tabscreen.dart';
import 'package:raahi/screens/mytripscreen.dart';
import 'package:raahi/screens/upcomingscreen.dart';
import 'package:raahi/screens/wishlistscreen.dart';
import 'package:raahi/widget/hometiles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // themeMode: ThemeMode.dark,
      theme: ThemeData(
        useMaterial3: true,
        textTheme: const TextTheme(
          headlineMedium: TextStyle(fontWeight: FontWeight.bold),
          titleMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      // home: TabScreen(),
      home: LoginScreen(),
      // home: HomeTiles(),
      // home: HomeScreen(),
      // home: UpcomingScreen(),
      // home: EventApi(),
      // home: StateOverview()
      // home: DestinationDetail(
      //     destinationName: 'rajasthan', destinationRating: '4')
      // home: ProfileScreen(),
      // home: MyTripScreen(),
      // home: WishListScreen(),
      // home: HomeImageProvider(),
    );
  }
}
