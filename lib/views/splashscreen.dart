import 'dart:async';
import 'home.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 10), vsync: this)
        ..repeat();
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 10), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: Colors.black87,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: AnimatedBuilder(
                      animation: _controller,
                      builder: (BuildContext context, Widget? child) {
                        return Transform.rotate(
                            angle: _controller.value * 2.0 * math.pi,
                            child: const Image(
                              image: AssetImage('assets/virus.png'),
                              height: 250,
                              width: 250,
                            ));
                      },
                    ),
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "COVID - 19",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(19, 171, 171, 1)),
                      ),
                      Text(
                        "Tracker Application",
                        style: TextStyle(
                            fontSize: 25,
                            color: Color.fromRGBO(19, 171, 171, 1)),
                      )
                    ],
                  )
                ],
              ),
            ));
  }
}
