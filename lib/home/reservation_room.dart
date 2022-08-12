import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:samaya_hotel/home/reservation_detail.dart';
import 'package:samaya_hotel/model/hotel_room.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

class ReservationRoom extends StatefulWidget {
  const ReservationRoom({Key? key}) : super(key: key);

  @override
  State<ReservationRoom> createState() => _ReservationRoomState();
}

class _ReservationRoomState extends State<ReservationRoom> {
  late List<HotelRoom> _hotelrooms;

  @override
  void initState() {
    super.initState();
    _hotelrooms = [
      HotelRoom(
        name: 'Superior King Bed Room',
        bed: 'King Bed',
        maxPerson: 'Max 2 Guest, 2 Children',
        price: 450000,
        refund: 'Non Refundable',
        images: 'images/hotels/hotelroom.jpg',
      ),
      HotelRoom(
        name: 'Prime King Bed Room',
        bed: 'King Bed',
        maxPerson: 'Max 2 Guest, 2 Children',
        price: 550000,
        refund: 'Non Refundable',
        images: 'images/hotels/hotelroom.jpg',
      ),
      HotelRoom(
        name: 'Deluxe King Bed Room',
        bed: 'King Bed',
        maxPerson: 'Max 2 Guest, 2 Children',
        price: 650000,
        refund: 'Non Refundable',
        images: 'images/hotels/hotelroom.jpg',
      ),
      HotelRoom(
        name: 'Junior King Bed Room',
        bed: 'King Bed',
        maxPerson: 'Max 2 Guest, 2 Children',
        price: 750000,
        refund: 'Non Refundable',
        images: 'images/hotels/hotelroom.jpg',
      ),
      HotelRoom(
        name: 'Suite King Bed Room',
        bed: 'King Bed',
        maxPerson: 'Max 2 Guest, 2 Children',
        price: 850000,
        refund: 'Non Refundable',
        images: 'images/hotels/hotelroom.jpg',
      ),
    ];
  }

  String _range = '';

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is PickerDateRange) {
        _range = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
            // ignore: lines_longer_than_80_chars
            ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
      } else if (args.value is DateTime) {
      } else if (args.value is List<DateTime>) {
      } else {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 180,
              width: MediaQuery.of(context).size.width *1,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    child: Container(
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
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: SizedBox(
                                      height: 30,
                                      width: 320,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          const Icon(
                                              Icons.calendar_month_outlined),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 6.0),
                                            child: Text(
                                              _range,
                                              style:
                                                  const TextStyle(fontSize: 18),
                                            ),
                                          ),
                                        ],
                                      )),
                                ),
                                InkResponse(
                                    onTap: () {
                                      _pressedDate();
                                    },
                                    child: const Icon(Icons.edit)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: SizedBox(
                                      height: 30,
                                      width: 320,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const <Widget>[
                                          Icon(Icons.bed),
                                          Padding(
                                            padding: EdgeInsets.only(left: 6.0),
                                            child: Text(
                                              '1 Room, 1 Guest',
                                              style: TextStyle(fontSize: 18),
                                            ),
                                          ),
                                        ],
                                      )),
                                ),
                                InkResponse(
                                    onTap: () {},
                                    child: const Icon(Icons.edit)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 50,
                    left: 35,
                    child: InkResponse(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const SizedBox(
                        child: Text(
                          'Room',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            //ini clone
            ListView.builder(
              physics: ScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {},
                      child: Padding(
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
                                      _hotelrooms[index].images!,
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
                                    _hotelrooms[index].name!,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  SizedBox(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        const Icon(Icons.bed),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(_hotelrooms[index].bed!),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Icon(Icons.money),
                                        const SizedBox(width: 5),
                                        Text(_hotelrooms[index].refund!)
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Icon(Icons.accessibility),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(_hotelrooms[index].maxPerson!),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          NumberFormat.currency(locale: 'id',symbol: 'IDR ', decimalDigits: 0).format(_hotelrooms[index].price!),
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                        const SizedBox(
                                          width: 60,
                                        ),
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                primary: Colors.deepPurple,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20))),
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ReservationDetail(
                                                              data: _hotelrooms[
                                                                  index])));
                                            },
                                            child: const Text(
                                              'Select',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                  ),
                  );
                },itemCount: _hotelrooms.length,
              ),


            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  void _pressedDate() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(
                width: 50,
                child: Divider(
                  color: Colors.black,
                  thickness: 2.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: SfDateRangePicker(
                  onSelectionChanged: _onSelectionChanged,
                  selectionMode: DateRangePickerSelectionMode.range,
                  initialSelectedRange: PickerDateRange(
                      DateTime.now().subtract(const Duration(days: 0)),
                      DateTime.now().add(const Duration(days: 0))),
                ),
              )
            ],
          );
        });
  }
}
