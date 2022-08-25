import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:samaya_hotel/bottomnavbar.dart';

class PaymentSuccess extends StatefulWidget {
  const PaymentSuccess({Key? key}) : super(key: key);

  @override
  State<PaymentSuccess> createState() => _PaymentSuccessState();
}

class _PaymentSuccessState extends State<PaymentSuccess> {
  @override
  void initState() {
    Timer(const Duration(milliseconds: 2500), () {
      //push and delete the preveious route
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => BottomNavigationBars()),
          (Route<dynamic> route) => false);
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _loading(),
                const Text(
                  'PAYMENT SUCCESS',
                  style: TextStyle(fontSize: 24),
                ),
                const Center(child: Text('Lorem Ipsum is simply dummy'))
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _loading() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Center(
          child: SizedBox(
              height: 100,
              width: 100,
              child: Lottie.asset('images/assets/successAnimation.json'))),
    );
  }
}
