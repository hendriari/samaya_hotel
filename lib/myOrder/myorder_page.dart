import 'package:flutter/material.dart';
import 'package:samaya_hotel/model/myorder.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

class Orderan extends StatefulWidget {
  const Orderan({Key? key}) : super(key: key);

  @override
  State<Orderan> createState() => _Orderan();
}

class _Orderan extends State<Orderan> {
  late List<HotelsInfo> _historyOrder;

  String? _range;
  DateTime dateNow = DateTime.now();
  final dates = DateFormat('EEEE, d MMMM y').format(DateTime.now());

  @override
  void initState() {
    super.initState();
    _range = dates;
    _historyOrder = [
      HotelsInfo(
        nameHotel: 'Hotel Samaya, Semarang',
        imageHotel: 'images/hotels/landingimages4.jpg',
        date: '4 Juni 2022 - 6 Juni 2022',
        guestRoom: '1 Room, 1 Guest',
        history: const Text(
          'Reserved',
          style: TextStyle(color: Colors.green, fontSize: 13),
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
          style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 13),
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
          style: TextStyle(
            color: Colors.deepPurpleAccent,
            fontSize: 13,
          ),
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
          style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 13),
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
          style: TextStyle(color: Colors.red, fontSize: 13),
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
          style: TextStyle(color: Colors.green, fontSize: 13),
        ),
        historyIcon: const Icon(
          Icons.check_circle,
          color: Colors.green,
        ),
      ),
    ];
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is PickerDateRange) {
        _range = 'On ${DateFormat('d MMM y').format(args.value.startDate)} -'
            // ignore: lines_longer_than_80_chars
            ' ${DateFormat('d MMM y').format(args.value.endDate ?? args.value.startDate)}';
      } else {}
    });
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
                    child: Container(
                      height: 100,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(107, 83, 204, 1),
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.elliptical(50, 30),
                          bottomLeft: Radius.elliptical(50, 30),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 83,
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
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Date',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 16),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () => _buildSelectedDate(),
                                    child: SizedBox(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const Icon(
                                            Icons.calendar_month_outlined,
                                            color: Colors.deepPurple,
                                          ),
                                          const SizedBox(
                                            width: 3,
                                          ),
                                          Text(
                                            _range!,
                                            style:
                                                const TextStyle(fontSize: 14),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: const Icon(
                                      Icons.search,
                                      color: Colors.deepPurple,
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(
                                color: Colors.black,
                              )
                            ],
                          ),
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
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: const EdgeInsets.only(right: 10),
                        height: 100,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 8, 8, 8),
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
                            Flexible(
                              fit: FlexFit.tight,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _historyOrder[index].nameHotel!,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      const Icon(
                                        Icons.calendar_month_outlined,
                                        color: Colors.deepPurple,
                                      ),
                                      Text(_historyOrder[index].date!)
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.bed_rounded,
                                            color: Colors.deepPurple,
                                          ),
                                          Text(
                                            _historyOrder[index].guestRoom!,
                                            style: const TextStyle(
                                              fontSize: 13,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            child: _historyOrder[index]
                                                .historyIcon!,
                                          ),
                                          SizedBox(
                                            width: 60,
                                            child:
                                                _historyOrder[index].history!,
                                          )
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
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
              SfDateRangePicker(
                todayHighlightColor: Colors.deepPurple,
                startRangeSelectionColor: Colors.deepPurple,
                endRangeSelectionColor: Colors.deepPurple,
                rangeSelectionColor: Colors.deepPurple.withOpacity(0.2),
                onSelectionChanged: _onSelectionChanged,
                selectionMode: DateRangePickerSelectionMode.range,
                initialSelectedRange: PickerDateRange(
                    DateTime.now().subtract(const Duration(days: 0)),
                    DateTime.now().add(const Duration(days: 0))),
              ),
            ],
          );
        });
  }
}
