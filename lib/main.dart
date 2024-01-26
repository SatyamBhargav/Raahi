import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:raahi/Api/eventapi.dart';
import 'package:raahi/Api/imageapi.dart';
import 'package:raahi/Api/overviewapi.dart';
import 'package:raahi/firebase_options.dart';
import 'package:raahi/screens/destinationDetails.dart';
import 'package:raahi/screens/explorescreen.dart';
import 'package:raahi/screens/homescreen.dart';
import 'package:raahi/screens/loadingscreen.dart';
import 'package:raahi/screens/loginscreen.dart';
import 'package:raahi/screens/profilescreen.dart';

import 'package:raahi/screens/tabscreen.dart';
import 'package:raahi/screens/mytripscreen.dart';
import 'package:raahi/screens/upcomingscreen.dart';
import 'package:raahi/screens/wishlistscreen.dart';
import 'package:raahi/widget/hometiles.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await dotenv.load();
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
      home: TabScreen(),
      // home: LoadingScreen(),
      // home: TabScreen(),
      // home: LoginScreen(),
      // home: ExploreScreen(),
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

      // home: StreamBuilder<User?>(
      //   stream: FirebaseAuth.instance.authStateChanges(),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.active) {
      //       User? user = snapshot.data;
      //       if (user == null) {
      //         return LoginScreen();
      //       } else {
      //         return TabScreen();
      //       }
      //     } else {
      //       return CircularProgressIndicator();
      //     }
      //   },
      // ),
    );
  }
}
