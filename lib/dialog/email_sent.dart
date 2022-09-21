import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmailSent extends StatelessWidget {
  const EmailSent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late double sizeWidth = MediaQuery.of(context).size.width;
    late double sizeHeight = MediaQuery.of(context).size.height;

    Timer(const Duration(milliseconds: 3500), () {
      Navigator.pop(context);
    });

    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: 100,
            width: sizeWidth * 1,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(107, 83, 204, 1),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.elliptical(50, 30),
                bottomLeft: Radius.elliptical(50, 30),
              ),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Center(
                    child: Lottie.asset('images/assets/emailAnimation.json'),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: sizeHeight * 0.54,
                  child: Column(
                    children: const [
                      Text(
                        'CHECK YOUR EMAIL',
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      Text('Lorem Ipsum is simply dummy')
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
