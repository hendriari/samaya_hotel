import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignUpSuccess extends StatefulWidget {
  const SignUpSuccess({Key? key}) : super(key: key);

  @override
  State<SignUpSuccess> createState() => _SignUpSuccessState();
}

class _SignUpSuccessState extends State<SignUpSuccess> {

  @override
  void initState() {
    Timer(const Duration(seconds: 3), (){
      Navigator.pop(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
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
                      children: [
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
    return Center(
      child: Image.asset('images/ceklist.gif'),
    );
  }
}
