import 'package:flutter/material.dart';

class FinalIteinerary extends StatelessWidget {
  FinalIteinerary({
    super.key,
    required this.destinationName,
    required this.startDate,
    required this.endDate,
    required this.budget,
  });
  String destinationName;
  String startDate;
  String endDate;
  String budget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Text(destinationName),
        Text(startDate),
        Text(endDate),
        Text(budget)
      ]),
    );
  }
}
