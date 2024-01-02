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
      body: Column(children: [
        SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              SizedBox(
                width: 310,
                child: const TextField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xff3DA35D), width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    hintText: 'Search destination...',
                    prefixIcon: Icon(Iconsax.search_normal),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Container(
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xff3DA35D)),
                child: IconButton(
                    onPressed: null,
                    icon: Icon(
                      Iconsax.send1,
                      color: Colors.white,
                    )),
              )
            ],
          ),
        )
      ]),
    );
  }
}
