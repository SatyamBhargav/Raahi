// ignore: file_names
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:raahi/Api/eventapi.dart';
import 'package:raahi/Api/imageapi.dart';
import 'package:raahi/Api/overviewapi.dart';


class DestinationDetail extends StatefulWidget {
  const DestinationDetail(
      {super.key,
      required this.destinationName,
      required this.destinationRating});
  final String destinationName;
  final String destinationRating;

  @override
  State<DestinationDetail> createState() => _DestinationDetailState();
}

class _DestinationDetailState extends State<DestinationDetail>
    with TickerProviderStateMixin {
  bool isAddedToWishlist = true;
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: Stack(children: [
        Container(
          width: double.infinity,
          color: Colors.green,
          child: ImageApi(stateName: '${widget.destinationName}'),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            height: 615,
            width: double.infinity,
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 40, left: 30),
                      child: Text(
                        widget.destinationName,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(top: 40, right: 55),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isAddedToWishlist = !isAddedToWishlist;
                            if (isAddedToWishlist == true) {
                              ScaffoldMessenger.of(context).clearSnackBars();
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text('Removed form wishlist'),
                                duration: Duration(seconds: 1),
                              ));
                            } else {
                              ScaffoldMessenger.of(context).clearSnackBars();
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Added to wishlist'),
                                      duration: Duration(seconds: 1)));
                            }
                          });
                        },
                        child: isAddedToWishlist
                            ? Icon(Iconsax.heart)
                            : Icon(
                                Iconsax.heart5,
                                color: Colors.red,
                              ),
                      ),
                    )
                  ],
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: Icon(
                        Iconsax.star1,
                        color: Colors.orange,
                        size: 30,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: Text(
                        widget.destinationRating,
                        style: TextStyle(fontSize: 18),
                      ),
                    )
                  ],
                ),
                Container(
                  child: TabBar(
                    indicatorColor: Color(0xff3da35d),
                    dividerColor: Colors.white,
                    labelColor: Color(0xff3da35d),
                    labelStyle:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    controller: tabController,
                    tabs: const [
                      Tab(text: 'Details'),
                      Tab(text: 'Events'),
                      Tab(text: 'Flights'),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 370,
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      StateOverview(stateName: '${widget.destinationName}'),
                      EventApi(stateName: widget.destinationName),
                      // UpcomingScreen(),

                      Text('HEY'),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: const ButtonStyle(
                      foregroundColor:
                          MaterialStatePropertyAll(Color(0xff134611)),
                      backgroundColor:
                          MaterialStatePropertyAll(Color(0xff96e072))),
                  onPressed: () => print('button is working'),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Create an Itinerary'),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
