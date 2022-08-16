import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:samaya_hotel/model/myorder.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

class Orderan extends StatefulWidget {
  const Orderan({Key? key}) : super(key: key);

  @override
  _Orderan createState() => _Orderan();
}

class _Orderan extends State<Orderan> {
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

  late List<HotelsInfo> _historyOrder;

  @override
  void initState() {
    super.initState();
    _historyOrder = [
      HotelsInfo(
        nameHotel: 'Hotel Samaya, Semarang',
        imageHotel: 'images/hotels/landingimages4.jpg',
        date: '4 Juni 2022 - 6 Juni 2022',
        guestRoom: '1 Room, 1 Guest',
        history: const Text(
          'Reserved',
          style: TextStyle(color: Colors.green),
        ),
        historyIcon: const Icon(
          Icons.check_circle,
          color: Colors.green,
        ),
      ),
      HotelsInfo(
        nameHotel: 'Hotel Samaya, Jakarta',
        imageHotel: 'images/hotels/landingimages4.jpg',
        date: '8 Juni 2022 - 9 Juni 2022',
        guestRoom: '1 Room, 1 Guest',
        history: const Text(
          'Finish',
          style: TextStyle(color: Colors.deepPurpleAccent),
        ),
        historyIcon: const Icon(
          Icons.access_time_filled,
          color: Colors.deepPurpleAccent,
        ),
      ),
      HotelsInfo(
        nameHotel: 'Hotel Samaya, Kab. Semarang',
        imageHotel: 'images/hotels/landingimages4.jpg',
        date: '10 Juni 2022 - 11 Juni 2022',
        guestRoom: '1 Room, 1 Guest',
        history: const Text(
          'Cancel',
          style: TextStyle(color: Colors.red),
        ),
        historyIcon: const Icon(
          Icons.cancel,
          color: Colors.red,
        ),
      ),
      HotelsInfo(
        nameHotel: 'Hotel Samaya, Klaten',
        imageHotel: 'images/hotels/landingimages4.jpg',
        date: '13 Juni 2022 - 15 Juni 2022',
        guestRoom: '1 Room, 1 Guest',
        history: const Text(
          'Waiting Payment',
          style: TextStyle(color: Colors.deepPurpleAccent),
        ),
        historyIcon: const Icon(
          Icons.access_time_filled_sharp,
          color: Colors.deepPurpleAccent,
        ),
      ),
      HotelsInfo(
        nameHotel: 'Hotel Samaya, Kab. Semarang',
        imageHotel: 'images/hotels/landingimages4.jpg',
        date: '19 Juni 2022 - 21 Juni 2022',
        guestRoom: '1 Room, 2 Guest',
        history: const Text(
          'Finish',
          style: TextStyle(color: Colors.deepPurpleAccent),
        ),
        historyIcon: const Icon(
          Icons.check_circle,
          color: Colors.deepPurpleAccent,
        ),
      ),
      HotelsInfo(
        nameHotel: 'Hotel Samaya, Jakarta',
        imageHotel: 'images/hotels/landingimages4.jpg',
        date: '1 July 2022 - 2 Juni 2022',
        guestRoom: '1 Room, 2 Guest',
        history: const Text(
          'Cancel',
          style: TextStyle(color: Colors.deepPurpleAccent),
        ),
        historyIcon: const Icon(
          Icons.cancel,
          color: Colors.red,
        ),
      ),
      HotelsInfo(
        nameHotel: 'Hotel Samaya, Semarang',
        imageHotel: 'images/hotels/landingimages4.jpg',
        date: '4 July 2022 - 6 July 2022',
        guestRoom: '1 Room, 2 Guest',
        history: const Text(
          'Reserved',
          style: TextStyle(color: Colors.green),
        ),
        historyIcon: const Icon(
          Icons.check_circle,
          color: Colors.green,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 180,
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
                            Align(
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(8, 15, 40, 0),
                                child: InkWell(
                                  onTap: () => _buildSelectedDate(),
                                  child: SizedBox(
                                    height: 40,
                                    width: double.infinity,
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const Icon(
                                                Icons.calendar_month_outlined),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              _range,
                                              style:
                                                  const TextStyle(fontSize: 16),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const Positioned(
                              top: 10,
                              left: 10,
                              child: Text(
                                'Date',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 16),
                              ),
                            ),
                            Positioned(
                                right: 10,
                                top: 0,
                                bottom: 0,
                                child: InkWell(
                                    onTap: () {},
                                    child: const Icon(Icons.search))),
                            const Align(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(8, 30, 8, 0),
                                child: Divider(
                                  color: Colors.black,
                                ),
                              ),
                            )
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
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ListView.builder(
                shrinkWrap: true,
                // scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: Column(
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
                                      _historyOrder[index].imageHotel!,
                                      fit: BoxFit.cover,
                                      height: 90,
                                      width: 100,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 120,
                                  top: 10,
                                  child: Text(
                                    _historyOrder[index].nameHotel!,
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                ),
                                Positioned(
                                  bottom: 40,
                                  left: 118,
                                  child: Row(
                                    children: <Widget>[
                                      const Icon(Icons.calendar_month_outlined),
                                      Text(_historyOrder[index].date!)
                                    ],
                                  ),
                                ),
                                Positioned(
                                  bottom: 14,
                                  left: 118,
                                  child: Row(
                                    children: <Widget>[
                                      const Icon(Icons.bed_rounded),
                                      Text(_historyOrder[index].guestRoom!),
                                    ],
                                  ),
                                ),
                                Positioned(
                                    bottom: 10,
                                    right: 20,
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          child:
                                              _historyOrder[index].historyIcon!,
                                        ),
                                        SizedBox(
                                          width: 50,
                                          child: _historyOrder[index].history!,
                                        )
                                      ],
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: _historyOrder.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _buildSelectedDate() {
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
