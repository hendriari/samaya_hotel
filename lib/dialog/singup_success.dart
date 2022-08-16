import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

class SignUpSuccess extends StatefulWidget {
  const SignUpSuccess({Key? key}) : super(key: key);

  @override
  State<SignUpSuccess> createState() => _SignUpSuccessState();
}

class _SignUpSuccessState extends State<SignUpSuccess> {
  @override
  void initState() {
    Timer(const Duration(milliseconds: 2600), () {
      Navigator.pop(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 120,
            width: MediaQuery.of(context).size.width * 1,
            child: SvgPicture.asset(
              'images/rectangle1.svg',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width * 1,
            ),
          ),
          Expanded(
              child: Stack(
            children: [
              _loading(),
              Positioned(
                left: 0,
                right: 0,
                top: MediaQuery.of(context).size.height * 0.5,
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
          )),
        ],
      ),
    );
  }

  Widget _loading() {
    return Positioned(
      left: 0,
      right: 0,
      top: MediaQuery.of(context).size.height * 0.28,
      child: Container(
        height: 200,
        width: 200,
        child:
            Center(child: Lottie.asset('images/assets/successAnimation.json')),
      ),
    );
  }
}
