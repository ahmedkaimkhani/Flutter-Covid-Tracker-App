import 'package:flutter/material.dart';
import 'dart:math' as math;

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  late final AnimationController _animationController =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedBuilder(
            animation: _animationController,
            child: Container(
              height: 200,
              width: 200,
              child: const Center(
                  child: Image(image: AssetImage('images/virus.png'))),
            ),
            builder: (BuildContext context, Widget? child) {
              return Transform.rotate(
                angle: _animationController.value * 2.0 * math.pi,
                child: child,
              );
            },
          )
        ],
      ),
    );
  }
}
