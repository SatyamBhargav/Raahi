import 'package:flutter/material.dart';
import 'package:raahi/screens/tabscreen.dart';

// ignore: must_be_immutable
class FinalIteinerary extends StatefulWidget {
  FinalIteinerary({super.key, required this.responseText});

  String responseText;

  @override
  State<FinalIteinerary> createState() => _FinalIteineraryState();
}

class _FinalIteineraryState extends State<FinalIteinerary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text("Please Enjoy"),
      ),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                child: Text(
                  widget.responseText,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 20),
                ),
              )
            ]),
      ),
    );
  }
}
