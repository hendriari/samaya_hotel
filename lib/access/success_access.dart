import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

class AccessSuccess extends StatefulWidget {
  const AccessSuccess({Key? key}) : super(key: key);

  @override
  State<AccessSuccess> createState() => _AccessSuccessState();
}

class _AccessSuccessState extends State<AccessSuccess> {
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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 180,
              width: double.infinity,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    child: SizedBox(
                      height: 120,
                      width: MediaQuery.of(context).size.width * 1,
                      child: SvgPicture.asset(
                        'images/rectangle1.svg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 90,
                    left: 0,
                    right: 0,
                    child: Align(
                      child: Container(
                          height: 82,
                          width: 350,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(
                                // blurStyle: BlurStyle.outer,
                                color: Colors.black54,
                                offset: Offset(1, 4),
                                blurRadius: 5,
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              const Positioned(
                                top: 10,
                                left: 10,
                                child: Text(
                                  'Hotel Samaya, Semarang',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 16),
                                ),
                              ),
                              Positioned(
                                top: 30,
                                left: 10,
                                child: SizedBox(
                                  child: Row(
                                    children: const [
                                      Icon(Icons.calendar_month_outlined),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text('1 July 2022 - 31 July 2022'),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                  top: 30,
                                  right: 10,
                                  child: SizedBox(
                                    child: Row(
                                      children: const [
                                        Icon(Icons.bed),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text('Room 0311')
                                      ],
                                    ),
                                  ))
                            ],
                          )),
                    ),
                  ),
                  const Positioned(
                    top: 50,
                    left: 35,
                    child: Text(
                      'Access',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.red,
              height: MediaQuery.of(context).size.height * 0.47,
              width: MediaQuery.of(context).size.width * 1,
              child: Lottie.asset('images/assets/ncf_card.json'),
            ),
            Text('Success Unlock'),
          ],
        ),
      ),
    );
  }
}
