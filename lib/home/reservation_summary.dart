import 'package:flutter/material.dart';
import 'package:samaya_hotel/model/hotel_room.dart';
import 'package:intl/intl.dart';

class ReservationSummary extends StatefulWidget {
  final HotelRoom data;

  ReservationSummary({required this.data});

  @override
  State<ReservationSummary> createState() => _ReservationSummaryState();
}

class _ReservationSummaryState extends State<ReservationSummary> {
  int _tax = 60000;
  late final int _total;

  @override
  void initState() {
    super.initState();
    _total = _tax + widget.data.price!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 130,
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
                    top: 50,
                    left: 35,
                    child: InkResponse(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SizedBox(
                        child: Row(
                          children: const [
                            Icon(
                              Icons.arrow_back_ios_new,
                              size: 15,
                              color: Colors.white,
                            ),
                            Text(
                              'Summary',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //ini asli

            //ini clone
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Hotel Samaya, Semarang',
                    style: const TextStyle(fontSize: 16),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Row(
                      children: const [
                        Icon(Icons.date_range),
                        SizedBox(width: 10),
                        Text(
                          '1 July 2022 - 31 July 2022',
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: const [
                      Icon(Icons.bed),
                      SizedBox(width: 10),
                      Text('1 Room, 1 Guest')
                    ],
                  ),
                  Row(
                    children: const [
                      Icon(Icons.accessibility),
                      SizedBox(width: 10),
                      Text('2 Guest')
                    ],
                  ),
                  const Divider(
                    color: Colors.black,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Superior King Bed Room',
                    style: const TextStyle(fontSize: 16),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Row(
                      children: const [
                        Icon(Icons.bed),
                        SizedBox(width: 10),
                        Text(
                          'King Bed',
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.money),
                      SizedBox(width: 10),
                      Text(
                        widget.data.refund!,
                      ),
                    ],
                  ),
                  const Divider(
                    color: Colors.black,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Guest Information',
                    style: const TextStyle(fontSize: 16),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Row(
                      children: const [
                        Icon(Icons.account_circle),
                        SizedBox(width: 10),
                        Text('Lilya Cordoba')
                      ],
                    ),
                  ),
                  Row(
                    children: const [
                      Icon(Icons.mail),
                      SizedBox(width: 10),
                      Text('lilyacordoba@gmail.com')
                    ],
                  ),
                  const Divider(
                    color: Colors.black,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Special Request',
                    style: const TextStyle(fontSize: 16),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Row(
                      children: const [
                        Icon(Icons.check_box),
                        SizedBox(width: 10),
                        Text('High Floor')
                      ],
                    ),
                  ),
                  const Divider(
                    color: Colors.black,
                  )
                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.fromLTRB(8, 1, 8, 0),
              child: Text(
                'Price Detail',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 2, 8, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.data.name!),
                  Text(NumberFormat.currency(
                          locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                      .format(widget.data.price!),style: TextStyle(fontWeight: FontWeight.bold),),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(8, 2, 8, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Tax & Service'),
                  SizedBox(
                      width: 70,
                      child: Text(NumberFormat.currency(
                              locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                          .format(_tax),style: TextStyle(fontWeight: FontWeight.bold),)),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(8, 2, 8, 0),
              child: Divider(
                color: Colors.black,
                thickness: 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 1, 8, 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Amount'),
                  SizedBox(
                      width: 70,
                      child: Text(
                        NumberFormat.currency(
                                locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                            .format(_total),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Center(
                child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              onPressed: () {},
              child: const Text(
                'Confirm',
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
