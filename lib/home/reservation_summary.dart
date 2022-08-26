import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:samaya_hotel/dialog/payment_loading.dart';
import 'package:samaya_hotel/model/hotel_room.dart';
import 'package:intl/intl.dart';
import 'package:samaya_hotel/model/singleton_model.dart';

class ReservationSummary extends StatefulWidget {
  // final HotelRoom data;
  final String selectedItem;
  final String? cekin;
  final String? cekout;
  final int? guest;
  final int? room;

  const ReservationSummary(
      {Key? key,
      required this.selectedItem,
      required this.room,
      required this.guest,
      required this.cekin,
      required this.cekout})
      : super(key: key);

  @override
  State<ReservationSummary> createState() => _ReservationSummaryState();
}

class _ReservationSummaryState extends State<ReservationSummary> {
  bool? loadingpayment;
  String? _selectedItem;
  String? cekin;
  String? cekout;
  int? _room;
  int? _guest;
  late SingletonModel _model;

  final int _tax = 60000;

  @override
  void initState() {
    super.initState();
    _model = SingletonModel.withContext(context);
    loadingpayment = false;
    _selectedItem = widget.selectedItem;
    cekin = widget.cekin;
    cekout = widget.cekout;
    _room = widget.room;
    _guest = widget.guest;
  }

  @override
  Widget build(BuildContext context) {
    //memanggil isi model tanpa mengeksekusi nilai dari model tersebut
    HotelRoom? model;
    _model.addItem!.forEach((element) {
      model = element.item;
    });

    int? subTotalRoom;
    for(var element in _model.addItem!){
     subTotalRoom = element.item.totalPrice!;
    }

    int? totalPrice;
    _model.addItem!.forEach((element) {
      totalPrice = element.item.totalPrice! + _tax;
    });
    return loadingpayment!
        ? const PaymentLoading()
        : Scaffold(
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 130,
                    width: MediaQuery.of(context).size.width * 1,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          child: SizedBox(
                            height: 120,
                            width: MediaQuery.of(context).size.width * 1,
                            child: SvgPicture.asset(
                              'images/rectangle1.svg',
                              fit: BoxFit.cover,
                              width: MediaQuery.of(context).size.width * 1,
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
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _selectedItem!,
                          style: const TextStyle(fontSize: 16),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.date_range,
                                color: Colors.deepPurple,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                cekin!,
                              ),
                              Text('- $cekout'),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.bed,
                              color: Colors.deepPurple,
                            ),
                            const SizedBox(width: 10),
                            Text('$_room Room, $_guest Guest')
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.person,
                              color: Colors.deepPurple,
                            ),
                            const SizedBox(width: 10),
                            Text('$_guest Guest')
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
                          'Room Specifications',
                          style: TextStyle(fontSize: 16),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.bed,
                                color: Colors.deepPurple,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'King Bed',
                              )
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.money,
                              color: Colors.deepPurple,
                            ),
                            const SizedBox(width: 10),
                            Text(model!.refund!),
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
                          style: TextStyle(fontSize: 16),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.person,
                                color: Colors.deepPurple,
                              ),
                              SizedBox(width: 10),
                              Text('Lilya Cordoba')
                            ],
                          ),
                        ),
                        Row(
                          children: const [
                            Icon(
                              Icons.mail,
                              color: Colors.deepPurple,
                            ),
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
                          style: TextStyle(fontSize: 16),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.check_box,
                                color: Colors.deepPurple,
                              ),
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
                        const Text('Sub Total Room'),
                        Text(
                          NumberFormat.currency(
                                  locale: 'id',
                                  symbol: 'IDR ',
                                  decimalDigits: 0)
                              .format(subTotalRoom),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 2, 2, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Tax & Service'),
                        SizedBox(
                          width: 70,
                          child: Text(
                            NumberFormat.currency(
                                    locale: 'id',
                                    symbol: 'IDR ',
                                    decimalDigits: 0)
                                .format(_tax),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
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
                        const Text('Total Payment'),
                        Text(
                          NumberFormat.currency(
                                  locale: 'id',
                                  symbol: 'IDR ',
                                  decimalDigits: 0)
                              .format(totalPrice),
                          style: const TextStyle(fontWeight: FontWeight.bold),
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
                        setState(() => loadingpayment = true);
                      },
                      child: const Text(
                        'Confirm',
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          );
  }
}
