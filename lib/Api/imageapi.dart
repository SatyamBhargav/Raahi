import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageApi extends StatefulWidget {
  const ImageApi({super.key, this.stateName});
  final stateName;

  @override
  _ImageApiState createState() => _ImageApiState();
}

class _ImageApiState extends State<ImageApi> {
  List<Map<String, dynamic>> bestImage = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchFlightResults();
  }

  Future<void> fetchFlightResults() async {
    const apiKey =
        '1b49aa31d7c9e086949e09fddb98f657585448bbe62af3d3ce0ce2e18d204443';
    final query = 'tourist places ${widget.stateName}';

    final url =
        'https://serpapi.com/search.json?engine=google&api_key=$apiKey&q=$query';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      setState(() {
        bestImage =
            List<Map<String, dynamic>>.from(data['top_sights']['sights']);
        isLoading = false;
      });
    } else {
      print('Error: ${response.statusCode}');
    }
  }

  double activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.only(top: 45),
              child: Stack(
                children: [
                  CarouselSlider.builder(
                    itemCount: 4,
                    itemBuilder: (context, index, realIndex) {
                      final images = bestImage[index];

                      return Column(
                        children: [
                          Container(
                            width: double.infinity,
                            child: Column(
                              children: [
                                Image.network(
                                  images['thumbnail'],
                                  height: 250,
                                  fit: BoxFit.cover,
                                ),

                                // SizedBox(height: 10),
                              ],
                            ),
                          ),
                        ],
                      );
                      // return ListTile(
                      //   title:
                      //   // subtitle: Text(images['title']),
                      // );
                    },
                    options: CarouselOptions(
                        viewportFraction: 1,
                        enableInfiniteScroll: true,
                        height: 350,
                        onPageChanged: (index, reason) {
                          setState(() {
                            activeIndex = index.toDouble();
                          });
                        }
                        // autoPlay: true,
                        // autoPlayInterval: const Duration(seconds: 2),
                        // enlargeCenterPage: true,
                        // enlargeStrategy: CenterPageEnlargeStrategy.scale,
                        ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 150),
                    child: SmoothIndicator(
                      offset: activeIndex,
                      count: 4,
                      size: Size(0, 420),
                      effect: SwapEffect(
                          activeDotColor: Colors.white, dotColor: Colors.black),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
