import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:raahi/data/places.dart';

class HomeTiles extends StatelessWidget {
  const HomeTiles({
    super.key,
    required this.imageUrl,
    required this.location,
    required this.locationName,
    required this.star,
  });
  final String imageUrl;
  final String location;
  final String locationName;
  final String star;

  @override
  Widget build(BuildContext context) {
    final imageData = placeDetails['cards']!;

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(20)),
              height: 320,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            height: 80,
            width: 330,
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 10),
                      child: Text(
                        location,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(locationName),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 20),
                    //   child:
                    // ),
                  ],
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    children: [
                      const SizedBox(width: 20),
                      const Icon(
                        Iconsax.star1,
                        color: Colors.amber,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        star,
                        style: const TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
