import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:samaya_hotel/home/reservation_summary.dart';
import 'package:samaya_hotel/model/hotel_room.dart';
import 'package:intl/intl.dart';

class ReservationDetail extends StatefulWidget {
  final HotelRoom data;

  const ReservationDetail({Key? key, required this.data}) : super(key: key);

  @override
  State<ReservationDetail> createState() => _ReservationDetailState();
}

class _ReservationDetailState extends State<ReservationDetail> {
  bool checkbox1 = false;
  bool checkbox2 = false;
  bool checkbox3 = false;

  final int _tax = 60000;
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
              height: 140,
              width: MediaQuery.of(context).size.width *1,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    child: SizedBox(
                      height: 120,
                      width: MediaQuery.of(context).size.width *1,
                      child: SvgPicture.asset(
                        'images/rectangle1.svg',
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width *1,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 50,
                    left: 25,
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
                              'Reservation',
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
            Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                          offset: Offset(1, 4),
                          blurRadius: 5,
                          color: Colors.black54),
                    ]),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: SizedBox(
                        width: 140,
                        height: 140,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              widget.data.images!,
                              fit: BoxFit.cover,
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.data.name!,
                            style: const TextStyle(fontSize: 16),
                          ),
                          SizedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(Icons.bed),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(widget.data.bed!),
                              ],
                            ),
                          ),
                          SizedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(Icons.money),
                                const SizedBox(width: 5),
                                Text(widget.data.refund!)
                              ],
                            ),
                          ),
                          SizedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(Icons.accessibility),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(widget.data.maxPerson!),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            alignment: Alignment.bottomRight,
                            height: 20,
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Text(NumberFormat.currency(locale: 'id', symbol: 'IDR ', decimalDigits: 0).format(widget.data.price!)),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //ini clone
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(8, 0, 8, 2),
              child: Text(
                'Guest Information',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 2, 8, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: Stack(
                      children: const [
                        Positioned(
                            left: 0,
                            top: 10,
                            child: Icon(Icons.account_circle)),
                        Align(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(23, 0, 23, 10),
                            child: TextField(
                              decoration: InputDecoration(hintText: 'Name'),
                            ),
                          ),
                        ),
                        Positioned(
                            right: 0,
                            top: 10,
                            child: Icon(Icons.check_rounded)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 2, 8, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: Stack(
                      children: const [
                        Positioned(left: 0, top: 10, child: Icon(Icons.email)),
                        Align(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(23, 0, 23, 10),
                            child: TextField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                hintText: 'Email',
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                            right: 0,
                            top: 10,
                            child: Icon(Icons.check_rounded)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: Text('Special Request', style: TextStyle(fontSize: 16)),
            ),
            Column(
              children: [
                Row(
                  children: <Widget>[
                    Checkbox(
                        activeColor: Colors.deepPurple,
                        value: checkbox1,
                        onChanged: (value) {
                          setState(() {
                            checkbox1 = value!;
                          });
                        }),
                    const Text(
                      'Good View',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                        activeColor: Colors.deepPurple,
                        value: checkbox2,
                        onChanged: (value) {
                          setState(() {
                            checkbox2 = value!;
                          });
                        }),
                    const Text(
                      'Non Smoking',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                        activeColor: Colors.deepPurple,
                        value: checkbox3,
                        onChanged: (value) {
                          setState(() {
                            checkbox3 = value!;
                          });
                        }),
                    const Text(
                      'High Floor',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 2, 8, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: Stack(
                          children: const [
                            Positioned(
                                left: 0,
                                top: 10,
                                child: Icon(Icons.note_alt_rounded)),
                            Align(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(23, 0, 23, 10),
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Other',
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                                right: 0,
                                top: 10,
                                child: Icon(Icons.check_rounded)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(8, 1, 8, 0),
              child: Text(
                'Price Detail',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 2, 13, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.data.name!),
                  Text(NumberFormat.currency(locale: 'id',symbol: 'IDR ', decimalDigits: 0)
                      .format(widget.data.price!)),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(8, 2, 8, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Tax & Service'),
                  SizedBox(
                      width: 70,
                      child: Text(
                          NumberFormat.currency(locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                              .format(_tax))),
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
                  const Text('Amount'),
                  SizedBox(
                    width: 70,
                    child: Text(
                      NumberFormat.currency(locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                          .format(_total),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Center(
                child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      //mengirim antar page, kirim data ke page 3
                        builder: (context) => ReservationSummary(data: widget.data)));
              },
              child: const Text(
                'Submit',
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
