import 'dart:ui';

import 'package:flutter/material.dart';

final _borderRadius = BorderRadius.circular(20);

class FrostGlass extends StatelessWidget {
  const FrostGlass(
      {super.key,
      required this.height,
      required this.width,
      required this.child});
  final height;
  final width;
  final child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: _borderRadius,
      child: SizedBox(
        width: width,
        height: height,
        child: Stack(children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white.withOpacity(0.2)),
              borderRadius: _borderRadius,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.black.withOpacity(0.4),
                  Colors.black.withOpacity(0.1)
                  // Colors.white.withOpacity(0.4),
                  // Colors.white.withOpacity(0.1),
                ],
              ),
            ),
          ),
          child,
        ]),
      ),
    );
  }
}
