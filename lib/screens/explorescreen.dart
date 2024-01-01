import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Where to?',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: const Column(children: [
        SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff3DA35D), width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              hintText: 'Search destination...',
              prefixIcon: Icon(Iconsax.search_normal),
            ),
          ),
        )
      ]),
    );
  }
}
