import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:samaya_hotel/home/reservation_summary.dart';
import 'package:intl/intl.dart';
import 'package:samaya_hotel/model/singleton_model.dart';

// import '../model/singleton_model.dart';

class ReservationDetail extends StatefulWidget {
  final String selectedItem;
  final String? cekin;
  final String? cekout;
  final int? guest;
  final int? room;

  const ReservationDetail({
    Key? key,
    required this.selectedItem,
    required this.room,
    required this.guest,
    required this.cekin,
    required this.cekout,
  }) : super(key: key);

  @override
  State<ReservationDetail> createState() => _ReservationDetailState();
}

class _ReservationDetailState extends State<ReservationDetail> {
  bool? checkbox1;
  bool? checkbox2;
  bool? checkbox3;

  int? _tax;

  String? cekin;
  String? cekout;

  late SingletonModel _model;

  @override
  void initState() {
    super.initState();
    checkbox1 = false;
    checkbox2 = false;
    checkbox3 = false;
    _tax = 60000;
    _model = SingletonModel.withContext(context);
    cekout = widget.cekout;
    cekin = widget.cekin;
    _model = SingletonModel.withContext(context);
  }

  @override
  Widget build(BuildContext context) {
    int? totalPrice;
    for (var element in _model.addItem!) {
      totalPrice = element.item.totalPrice! + _tax!;
    }

    int? subTotal;
    for (var element in _model.addItem!) {
      subTotal = element.item.totalPrice!;
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 140,
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

            //kamar dipilih
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    height: 160,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(1, 4),
                            blurRadius: 5,
                            color: Colors.black54),
                      ],
                    ),
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
                                  _model.addItem![index].item.images!,
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
                                _model.addItem![index].item.name!,
                                style: const TextStyle(fontSize: 16),
                              ),
                              SizedBox(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      Icons.bed,
                                      color: Colors.deepPurple,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(_model.addItem![index].item.bed!),
                                  ],
                                ),
                              ),
                              SizedBox(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      Icons.money,
                                      color: Colors.deepPurple,
                                    ),
                                    const SizedBox(width: 5),
                                    Text(_model.addItem![index].item.refund!)
                                  ],
                                ),
                              ),
                              SizedBox(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      Icons.person,
                                      color: Colors.deepPurple,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                        _model.addItem![index].item.maxPerson!),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 40,
                                width: MediaQuery.of(context).size.width * 0.55,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: SizedBox(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const Text(
                                              'Price',
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                            Text(NumberFormat.currency(
                                                    locale: 'id',
                                                    symbol: 'IDR ',
                                                    decimalDigits: 0)
                                                .format(_model.addItem![index]
                                                    .item.price!)),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                      child: SizedBox(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const Text(
                                              'Amount',
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                            Text(
                                                '${_model.addItem![index].jumlahItem} Room'),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Sub Total',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                          Text(NumberFormat.currency(
                                            locale: 'id',
                                            symbol: 'IDR ',
                                            decimalDigits: 0,
                                          ).format(_model.addItem![index].item
                                              .selectedRoomPrice!)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: _model.addItem!.length,
            ),
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
                          child: Icon(
                            Icons.person,
                            color: Colors.deepPurple,
                          ),
                        ),
                        Align(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(25, 0, 23, 10),
                            child: TextField(
                              cursorColor: Colors.deepPurple,
                              decoration: InputDecoration(hintText: 'Name'),
                            ),
                          ),
                        ),
                        Positioned(
                            right: 0,
                            top: 10,
                            child:
                                Icon(Icons.check_rounded, color: Colors.green)),
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
                        Positioned(
                          left: 0,
                          top: 10,
                          child: Icon(
                            Icons.email,
                            color: Colors.deepPurple,
                          ),
                        ),
                        Align(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(25, 0, 23, 10),
                            child: TextField(
                              cursorColor: Colors.deepPurple,
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
                            child: Icon(
                              Icons.check_rounded,
                              color: Colors.green,
                            )),
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
                          setState(
                            () {
                              checkbox1 = value!;
                            },
                          );
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
                                child: Icon(
                                  Icons.note_alt_rounded,
                                  color: Colors.deepPurple,
                                )),
                            Align(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(25, 0, 23, 10),
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
                              child: Icon(
                                Icons.check_rounded,
                                color: Colors.green,
                              ),
                            ),
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
              padding: const EdgeInsets.fromLTRB(8, 2, 8, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Sub Total Price'),
                  Text(NumberFormat.currency(
                          locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                      .format(subTotal)),
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
                      child: Text(NumberFormat.currency(
                              locale: 'id', symbol: 'IDR ', decimalDigits: 0)
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
                  const Text('Total Payment'),
                  const Spacer(),
                  SizedBox(
                    // width: 70,
                    child: Text(
                      NumberFormat.currency(
                              locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                          .format(totalPrice),
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
                          builder: (context) => ReservationSummary(
                                guest: widget.guest!,
                                room: widget.room!,
                                cekin: widget.cekin!,
                                cekout: widget.cekout!,
                                selectedItem: widget.selectedItem,
                              )));
                },
                child: const Text(
                  'Submit',
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
