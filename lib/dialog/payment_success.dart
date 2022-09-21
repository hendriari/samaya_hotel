import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:samaya_hotel/bottomnavbar.dart';

class PaymentSuccess extends StatelessWidget {
  const PaymentSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late double sizeWidth = MediaQuery.of(context).size.width;

    Timer(const Duration(milliseconds: 2500), () {
      //push and delete the preveious route
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const BottomNavigationBars()),
          (Route<dynamic> route) => false);
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
