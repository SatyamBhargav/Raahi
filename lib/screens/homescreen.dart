import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:raahi/data/places.dart';
import 'package:raahi/screens/destinationDetails.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final imageData = placeDetails['cards']!;

  Widget builderImage(String urlImage, String name, String location,
          String star, int index) =>
      Container(
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.green,
          image:
              DecorationImage(image: AssetImage(urlImage), fit: BoxFit.cover),
        ),
        // margin: EdgeInsets.symmetric(horizontal: 1),
        // height: 10,
        width: 280,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  // alignment: Alignment.topCenter,
                  height: 60,
                  width: 190,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white.withOpacity(0.8),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 5),
                      Text(location),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Iconsax.star1,
                            color: Colors.orange,
                            size: 20,
                          ),
                          Text(' $star | $name')
                        ],
                      )
                    ],
                  )),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Raahi',
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: const Color(0xff3a5a40), fontFamily: 'Samarkan'),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Popular Destination',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: const Color(0xff3a5a40)),
            ),
            const SizedBox(height: 20),
            CarouselSlider.builder(
              itemCount: imageData.length,
              itemBuilder: (context, index, realIndex) {
                // final images = bestImage[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DestinationDetail(
                                  destinationName: imageData[index][1],
                                  destinationRating: imageData[index][3],
                                )));
                  },
                  child: builderImage(imageData[index][0], imageData[index][1],
                      imageData[index][2], imageData[index][3], index),
                );
              },
              options: CarouselOptions(
                  viewportFraction: 0.7,
                  enableInfiniteScroll: true,
                  height: 650,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 2),
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.scale),
            ),
          ],
        ),
      ),
    );
  }
}
