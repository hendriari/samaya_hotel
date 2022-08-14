import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';


class PaymentSuccess extends StatefulWidget {
  const PaymentSuccess({Key? key}) : super(key: key);

  @override
  State<PaymentSuccess> createState() => _PaymentSuccessState();
}



class _PaymentSuccessState extends State<PaymentSuccess> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), (){
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
              )),
        ],
      ),
    );
  }
  Widget _loading(){
    return const SpinKitPumpingHeart(
      size: 120,
      color: Colors.deepPurple,
      duration: Duration(seconds: 2),
    );
  }
}


