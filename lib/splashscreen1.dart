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
          onTap: () {
            setState(() {
              click = !click;
            });
            setState(() async {
              await Future.delayed(Duration(milliseconds: 280), () {});
              Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (context, animasi1, animasi2) =>
                          SplashScreen2()));
            });
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            height: click ? MediaQuery.of(context).size.height * 1 : 130 ,
            width: click ? MediaQuery.of(context).size.width * 1 : 130  ,
            curve: Curves.fastOutSlowIn,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(1, 4),
                      blurRadius: 5,
                      color: Colors.black45)
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Samaya',
                  style: TextStyle(fontSize: 28),
                ),
                Text(
                  'Hotel',
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
