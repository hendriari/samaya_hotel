import 'package:flutter/material.dart';


class Orderan extends StatefulWidget {
  _Orderan createState() => _Orderan();
}

class _Orderan extends State<Orderan> {
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
                    child: Image.asset(
                      'images/Rectangle4.png',
                      fit: BoxFit.cover,
                      width: double.infinity,
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
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 50,
                    left: 35,
                    child: Text(
                      'My Order',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  const Positioned(
                    bottom: 66,
                    left: 50,
                    child: Text(
                      'Date',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ListView(
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(20)),
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                left: 10,
                                bottom: 5,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    'images/landingimages4.jpg',
                                    fit: BoxFit.cover,
                                    height: 90,
                                    width: 100,
                                  ),
                                ),
                              ),
                              const Positioned(
                                left: 120,
                                top: 10,
                                child: Text(
                                  'Hotel Samaya, Semarang',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              Positioned(
                                bottom: 40,
                                left: 118,
                                child: Row(
                                  children: const <Widget>[
                                    Icon(Icons.calendar_month_outlined),
                                    Text('4 July 2023 - 5 July 2023')
                                  ],
                                ),
                              ),
                              Positioned(
                                bottom: 14,
                                left: 118,
                                child: Row(
                                  children: const <Widget>[
                                    Icon(Icons.bed_rounded),
                                    Text('1 Room, 1 Guest')
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
