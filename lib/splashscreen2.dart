import 'package:flutter/material.dart';
import 'package:samaya_hotel/landing_page.dart';

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
    await Future.delayed(Duration(milliseconds: 100), () {});
    Navigator.pushReplacement(
        context,
        PageRouteBuilder(
            pageBuilder: (context, animasi1, animasi2) => LandingPage(),transitionDuration: Duration.zero,reverseTransitionDuration: Duration.zero));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(),
    );
  }
}
