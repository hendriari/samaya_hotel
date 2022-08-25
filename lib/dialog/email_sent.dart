import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

class EmailSent extends StatefulWidget {
  const EmailSent({Key? key}) : super(key: key);

  @override
  State<EmailSent> createState() => _EmailSentState();
}

class _EmailSentState extends State<EmailSent> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
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

  Widget _loading() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Center(
        child: Lottie.asset('images/assets/emailAnimation.json'),
      ),
    );
  }
}
