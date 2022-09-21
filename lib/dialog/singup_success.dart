import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SignUpSuccess extends StatelessWidget {
  const SignUpSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late double sizeHeight = MediaQuery.of(context).size.height;

    Timer(const Duration(milliseconds: 2600), () {
      Navigator.pop(context);
    });

    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: 100,
            width: double.infinity,
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
                Positioned(
                  left: 0,
                  right: 0,
                  top: sizeHeight * 0.28,
                  child: SizedBox(
                    height: 200,
                    width: 200,
                    child: Center(
                        child: Lottie.asset(
                            'images/assets/successAnimation.json')),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: MediaQuery.of(context).size.height * 0.54,
                  child: Column(
                    children: const [
                      Text(
                        'SIGN UP SUCCESS',
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
