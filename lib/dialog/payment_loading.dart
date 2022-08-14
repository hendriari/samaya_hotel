import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:samaya_hotel/dialog/payment_success.dart';

class PaymentLoading extends StatefulWidget {
  const PaymentLoading({Key? key}) : super(key: key);

  @override
  State<PaymentLoading> createState() => _PaymentLoadingState();
}

class _PaymentLoadingState extends State<PaymentLoading> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          PageRouteBuilder(
              pageBuilder: (context, animated1, animated2) => const PaymentSuccess(),
              transitionDuration: Duration.zero,
              reverseTransitionDuration: Duration.zero));
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
                'TRANSACTION IN PROGRESS',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              const Center(child: Text('Lorem Ipsum is simply dummy'))
            ],
          )),
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
