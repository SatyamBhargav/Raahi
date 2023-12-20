import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class UpcomingScreen extends StatelessWidget {
  const UpcomingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(10),
        shrinkWrap: true,
        children: [
          Card(
            child: ListTile(
              title: Text('Destination'),
              subtitle: Text('$DateTime.now()'),
              leading: Icon(Icons.flight_takeoff_rounded),
              trailing: Icon(Iconsax.ticket_star),
            ),
          )
        ],
      ),
    );
  }
}
