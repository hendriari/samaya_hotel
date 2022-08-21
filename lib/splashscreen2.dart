import 'package:flutter/material.dart';
import 'package:samaya_hotel/landing_page.dart';
import 'dart:async';

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({Key? key}) : super(key: key);

  @override
  State<SplashScreen2> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {
  @override
  void initState() {
    super.initState();
    _splashscreen();
  }

  _splashscreen() async {
    await Future.delayed(const Duration(milliseconds: 50), () {});
    if(!mounted) return;
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondAnimation) => const LandingPage(),
        transitionDuration: Duration(seconds: 2),
        transitionsBuilder: (context, animation, secondAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          const curve = Curves.easeInOutBack;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));


          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(),
    );
  }
}
