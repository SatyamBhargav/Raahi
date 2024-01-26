import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:raahi/screens/tabscreen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  int counter = 1;
  late Timer _timer;
  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (counter < 25) {
          counter++;
        } else {
          _timer.cancel();
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const String assetUrl1 =
        'https://lottie.host/7c4ebae0-9fff-472c-9cc8-3d6d95c17e6e/nOgCW4MkhJ.json';
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.black.withOpacity(0.4),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.network(assetUrl1, controller: _controller,
                onLoaded: (composition) {
              _controller
                ..duration = composition.duration
                ..forward()
                ..repeat();
            }),
            Text(
              "Loading...$counter/25",
              style: TextStyle(fontSize: 20),
            ),
            // ElevatedButton(
            //     onPressed: () {
            //       Navigator.push(context,
            //           MaterialPageRoute(builder: (context) => TabScreen()));
            //     },
            //     child: Text('Next'))
          ],
        )),
      ),
    );
  }
}
