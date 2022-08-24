import 'package:flutter/material.dart';
import 'package:samaya_hotel/splashscreen2.dart';

class SplashScreen1 extends StatefulWidget {
  const SplashScreen1({Key? key}) : super(key: key);

  @override
  State<SplashScreen1> createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreen1> {
  bool click = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: GestureDetector(
          onTap: () async {
            setState(() {
              click = !click;
            });
            await Future.delayed(const Duration(milliseconds: 150));
            setState(() {
              // await Future.delayed(const Duration(milliseconds: 480));
              if (!mounted) return;
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondAnimation) =>
                      const SplashScreen2(),
                  transitionDuration: const Duration(milliseconds: 1),
                  transitionsBuilder:
                      (context, animation, secondAnimation, child) {
                    const begin = Offset(0.0, 1.0);
                    const end = Offset.zero;
                    const curve = Curves.fastLinearToSlowEaseIn;

                    var tween = Tween(begin: begin, end: end)
                        .chain(CurveTween(curve: curve));

                    return SlideTransition(
                      position: animation.drive(tween),
                      child: child,
                    );
                  },
                ),
              );
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            height: click ? MediaQuery.of(context).size.height * 1 : 130,
            width: click ? MediaQuery.of(context).size.width * 1 : 130,
            curve: Curves.fastOutSlowIn,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    offset: Offset(1, 4), blurRadius: 5, color: Colors.black45)
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Samaya',
                  style: TextStyle(fontSize: 28),
                ),
                Text(
                  'Hotel',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
