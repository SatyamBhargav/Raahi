import 'package:flutter/material.dart';
import 'package:raahi/screens/destinationDetails.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      children: [
        Padding(
          padding: EdgeInsets.all(12),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DestinationDetail(
                            destinationName: 'Destination',
                            destinationRating: 'state',
                          )));
            },
            child: Card(
              child: ListTile(
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text('Destination'), Text('State')],
                ),
                // subtitle: Text('State'),
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Container(
                    height: 90,
                    width: 50,
                    decoration: BoxDecoration(color: Colors.amber),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    ));
  }
}
