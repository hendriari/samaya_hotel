import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';

class PaymentLoading extends StatefulWidget {
  const PaymentLoading({Key? key}) : super(key: key);

  @override
  State<PaymentLoading> createState() => _PaymentLoadingState();
}

class _PaymentLoadingState extends State<PaymentLoading> {

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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SpinKitCircle(
                    size: 120,
                    color: Colors.deepPurple,
                    duration: Duration(seconds: 3),
                  ),
                  Text('PAYMENT GATEWAY',
                  style: TextStyle(fontSize: 24),),
                  Center(child: Text('Lorem Ipsum is simply dummy'))
                ],
              )),
        ],
      ),
    );
  }
}
