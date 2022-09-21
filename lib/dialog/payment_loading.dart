import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:samaya_hotel/dialog/payment_success.dart';

class PaymentLoading extends StatelessWidget {
  const PaymentLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late double sizeWidth = MediaQuery.of(context).size.width;

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          PageRouteBuilder(
              pageBuilder: (context, animated1, animated2) =>
                  const PaymentSuccess(),
              transitionDuration: Duration.zero,
              reverseTransitionDuration: Duration.zero));
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
                  'TRANSACTION IN PROGRESS',
                  style: TextStyle(
                    fontSize: 24,
                  ),
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
    return const SpinKitCircle(
      size: 120,
      color: Colors.deepPurple,
      duration: Duration(seconds: 3),
    );
  }
}
