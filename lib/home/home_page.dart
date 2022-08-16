import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:samaya_hotel/dialog/page_view.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

import 'home_reservation.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {


  String _selectedItem = '';

  var _guest = 0;
  var _count = 0;

  get callBack => _count;

  void _incrementCount() {
    setState(() {
      _count++;
    });
  }

  void _decrementCount() {
    if (_count < 1) {
      return;
    }
    setState(() {
      _count--;
    });
  }

  void _incrementGuest() {
    setState(() {
      _guest++;
    });
  }

  void _decrementGuest() {
    if (_guest < 1) {
      return;
    }
    setState(() {
      _guest--;
    });
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
          children: <Widget>[
            _header(),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 30,
              width: MediaQuery.of(context).size.width,
              child: const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Recomended Vacation',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            SizedBox(
              height: 150,
              width: double.infinity,
              child: ListView(
                physics: const ScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Stack(
                      children: <Widget>[
                        Align(
                          child: Container(
                              height: 116,
                              width: 262,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black54,
                                      offset: Offset(1, 4),
                                      blurRadius: 5,
                                    )
                                  ]),
                              child: Stack(children: <Widget>[
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network(
                                        'https://a.cdn-hotels.com/gdcs/production143/d1112/c4fedab1-4041-4db5-9245-97439472cf2c.jpg',
                                        fit: BoxFit.cover,
                                        width: double.infinity)),
                                Positioned(
                                  bottom: 0,
                                  left: 100,
                                  right: 100,
                                  child: Container(
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.black38,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'Bali',
                                        style: TextStyle(
                                            color: Colors.amber, fontSize: 20),
                                      ),
                                    ),
                                  ),
                                ),
                              ])),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Stack(
                      children: <Widget>[
                        Align(
                          child: Container(
                              height: 116,
                              width: 262,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black54,
                                      offset: Offset(1, 4),
                                      blurRadius: 5,
                                    )
                                  ]),
                              child: Stack(children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                      'https://asset.kompas.com/crops/PREP49IjcIsLm5BEFNlETeDO8PE=/0x118:1430x1071/750x500/data/photo/2022/03/07/6225c0669e6d2.jpg',
                                      fit: BoxFit.cover,
                                      width: double.maxFinite),
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: 50,
                                  right: 50,
                                  child: Container(
                                    width: 250,
                                    decoration: BoxDecoration(
                                      color: Colors.black38,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'Candi Borobudur',
                                        style: TextStyle(
                                            color: Colors.amber, fontSize: 20),
                                      ),
                                    ),
                                  ),
                                ),
                              ])),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Stack(
                      children: <Widget>[
                        Align(
                          child: Container(
                              height: 116,
                              width: 262,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black54,
                                      offset: Offset(1, 4),
                                      blurRadius: 5,
                                    )
                                  ]),
                              child: Stack(children: <Widget>[
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network(
                                      'https://www.water-sport-bali.com/wp-content/uploads/2014/04/Gili-Trawangan-Feature-Image.jpg',
                                       fit: BoxFit.cover,
                                      width: double.infinity,
                                    )),
                                Positioned(
                                  bottom: 0,
                                  left: 60,
                                  right: 60,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.black38,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'Kepulauan Gili',
                                        style: TextStyle(
                                            color: Colors.amber, fontSize: 20),
                                      ),
                                    ),
                                  ),
                                ),
                              ])),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Stack(
                      children: <Widget>[
                        Align(
                          child: Container(
                              height: 116,
                              width: 262,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black54,
                                      offset: Offset(1, 4),
                                      blurRadius: 5,
                                    )
                                  ]),
                              child: Stack(children: <Widget>[
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network(
                                        'https://cdn0-production-images-kly.akamaized.net/-sRCwJVkyXPnJNK03iIeB6qkGtg=/1200x900/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/3142400/original/014117500_1591150864-labuanbajo-3687809_1280.jpg',
                                        fit: BoxFit.cover,
                                        width: double.infinity)),
                                Positioned(
                                  bottom: 0,
                                  left: 60,
                                  right: 60,
                                  child: Container(
                                    width: 250,
                                    decoration: BoxDecoration(
                                      color: Colors.black38,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'Pulau Komodo',
                                        style: TextStyle(
                                            color: Colors.amber, fontSize: 20),
                                      ),
                                    ),
                                  ),
                                ),
                              ])),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 30,
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Promotion',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            SizedBox(
              height: 150,
              width: double.infinity,
              child: ListView(
                physics: const ScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Stack(
                      children: <Widget>[
                        Align(
                          child: Image.asset('images/promotionimage1.png'),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Stack(
                      children: <Widget>[
                        Align(
                          child: Image.asset('images/promotionimage1.png'),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Stack(
                      children: <Widget>[
                        Align(
                          child: Image.asset('images/promotionimage1.png'),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Stack(
                      children: <Widget>[
                        Align(
                          child: Image.asset('images/promotionimage1.png'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return SizedBox(
      height: 400,
      // height: MediaQuery.of(context).size.height * 0.6,
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
          const Positioned(
            top: 50,
            left: 35,
            child: Text(
              'Hi, Lilya',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          Positioned(
            top: 90,
            left: 0,
            right: 0,
            child: Align(
              child: Container(
                height: 300,
                width: 350,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black54,
                        offset: Offset(1, 4),
                        blurRadius: 5,
                      ),
                    ]),
                child: Stack(
                  children: <Widget>[
                    const Positioned(
                      left: 20,
                      top: 10,
                      child: Text(
                        'Where would you like to stay?',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ),
                    Positioned(
                        top: 20,
                        left: 0,
                        right: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 40,
                            child: InkWell(
                              onTap: () => _onButtonPressed(),
                              child: Column(
                                children: [
                                  Container(
                                      alignment: Alignment.topLeft,
                                      child: Row(
                                        children: [
                                          const Icon(Icons.location_pin),
                                          Text(
                                            _selectedItem,
                                            style:
                                                const TextStyle(fontSize: 16),
                                          ),
                                        ],
                                      )),
                                  const Divider(
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )),
                    const Positioned(
                      left: 20,
                      top: 70,
                      child: Text(
                        'Check In',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ),
                    Positioned(
                        top: 80,
                        left: 0,
                        right: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 40,
                            child: InkWell(
                              onTap: () => _pressedDate(),
                              child: Column(
                                children: [
                                  Container(
                                      alignment: Alignment.topLeft,
                                      child: Row(
                                        children: [
                                          const Icon(
                                              Icons.calendar_month_outlined),
                                          Text(
                                            _range,
                                            style:
                                                const TextStyle(fontSize: 16),
                                          ),
                                        ],
                                      )),
                                  const Divider(
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )),
                    const Positioned(
                      left: 20,
                      top: 130,
                      child: Text(
                        'Check Out',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ),
                    Positioned(
                        top: 140,
                        left: 0,
                        right: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 40,
                            child: InkWell(
                              onTap: () => _pressedDate(),
                              child: Column(
                                children: [
                                  Container(
                                      alignment: Alignment.topLeft,
                                      child: Row(
                                        children: [
                                          const Icon(
                                              Icons.calendar_month_outlined),
                                          Text(
                                            _range,
                                            style:
                                                const TextStyle(fontSize: 16),
                                          ),
                                        ],
                                      )),
                                  const Divider(
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )),
                    const Positioned(
                      left: 20,
                      top: 190,
                      child: Text(
                        'Room & Guest',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ),
                    Positioned(
                        top: 200,
                        left: 0,
                        right: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 40,
                            child: InkWell(
                              onTap: () => _onSelectionRoom(),
                              child: Column(
                                children: [
                                  Container(
                                      alignment: Alignment.topLeft,
                                      child: Row(
                                        children: [
                                          const Icon(Icons.bed),
                                          Text(
                                            "$callBack Room, $_guest Guest",
                                            style:
                                                const TextStyle(fontSize: 16),
                                          ),
                                        ],
                                      )),
                                  const Divider(
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child: Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.deepPurple,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeReservation(
                                          date: _range,
                                        )),
                              );
                            },
                            child: const Text('Search'),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //for location hotels
  void _onButtonPressed() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        context: context,
        builder: (context) {
          return ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              SizedBox(
                height: double.maxFinite,
                child: Container(
                  child: _buildBottomNavigationMenu(),
                ),
              ),
            ],
          );
        });
  }

  //select location hotels
  Column _buildBottomNavigationMenu() {
    return Column(
      children: <Widget>[
        const Expanded(
          flex: 0,
          child: SizedBox(
            width: 50,
            child: Divider(
              color: Colors.black,
              thickness: 2,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Container(
            alignment: Alignment.topLeft,
            width: double.infinity,
            child: Stack(
              children: <Widget>[
                const Center(
                  child: Text(
                    'Hotel',
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(35, 20, 30, 0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none
                    ),
                  ),
                ),
                Positioned(
                    child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(Icons.location_pin),
                          InkResponse(
                              onTap: (){},
                              child: const Icon(Icons.search))],
                      ),
                      const Divider(
                        color: Colors.black,
                      )
                    ],
                  ),
                ))
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(1, 4),
                          color: Colors.black54,
                          blurRadius: 5,
                        )
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      leading: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset('images/hotel.png')),
                      title: const Text('Hotel Samaya, Semarang'),
                      onTap: () => _selectItem('Hotel Samaya, Semarang'),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(1, 4),
                          color: Colors.black54,
                          blurRadius: 5,
                        )
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      leading: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset('images/hotel.png')),
                      title: const Text('Hotel Samaya, Kab. Semarang'),
                      onTap: () => _selectItem('Hotel Samaya, Kab. Semarang'),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(1, 4),
                          color: Colors.black54,
                          blurRadius: 5,
                        )
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      leading: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset('images/hotel.png')),
                      title: const Text('Hotel Samaya, Klaten'),
                      onTap: () => _selectItem('Hotel Samaya, Klaten'),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(1, 4),
                          color: Colors.black54,
                          blurRadius: 5,
                        )
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      leading: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset('images/hotel.png')),
                      title: const Text('Hotel Samaya, Solo'),
                      onTap: () => _selectItem('Hotel Samaya, Solo'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  void _selectItem(String name) {
    Navigator.pop(context);
    setState(() {
      _selectedItem = name;
    });
  }

  //select date
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

  void _onSelectionRoom() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        context: context,
        builder: (context) {
          return Column(
            children: [
              Container(
                child: _buildButtonSelectionRoom(),
              ),
              Container(
                child: _buildButtonSelectionGuest(),
              )
            ],
          );
        });
  }

  Widget _buildButtonSelectionRoom() {
    return Column(
      children: <Widget>[
        const Expanded(
            flex: 0,
            child: SizedBox(
              width: 50,
              child: Divider(
                color: Colors.black,
                thickness: 2,
              ),
            )),
        Padding(
          padding: const EdgeInsets.all(10),
          child: SizedBox(
            height: 60,
            width: double.infinity,
            child: Stack(
              children: [
                const Positioned(
                  left: 10,
                  top: 5,
                  child: Text(
                    'Room',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ),
                const Positioned(
                  left: 10,
                  top: 25,
                  child: Icon(Icons.bed),
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: InkResponse(
                      onTap: () {
                        _incrementCount();
                      },
                      child: const Icon(Icons.keyboard_arrow_up)),
                ),
                Positioned(
                    right: 10,
                    bottom: 10,
                    child: InkResponse(
                        onTap: () {
                          _decrementCount();
                        },
                        child: const Icon(Icons.keyboard_arrow_down))),
                Positioned(
                    left: 40,
                    top: 25,
                    child: Text(
                      "$_count",
                      style: const TextStyle(fontSize: 16),
                    )),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Container(
                      alignment: Alignment.bottomCenter,
                      child: const Divider(
                        color: Colors.black,
                      )),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildButtonSelectionGuest() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10),
          child: SizedBox(
            height: 60,
            width: double.infinity,
            child: Stack(
              children: [
                const Positioned(
                  left: 10,
                  top: 5,
                  child: Text(
                    'Guest',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ),
                const Positioned(
                  left: 10,
                  top: 25,
                  child: Icon(Icons.person),
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: InkResponse(
                      onTap: () {
                        _incrementGuest();
                      },
                      child: const Icon(Icons.keyboard_arrow_up)),
                ),
                Positioned(
                    right: 10,
                    bottom: 10,
                    child: InkResponse(
                        onTap: () {
                          _decrementGuest();
                        },
                        child: const Icon(Icons.keyboard_arrow_down))),
                Positioned(
                    left: 40,
                    top: 25,
                    child: Text(
                      "$_guest",
                      style: const TextStyle(fontSize: 16),
                    )),
                Positioned(
                    left: 40,
                    top: 25,
                    child: Text(
                      "$_guest",
                      style: const TextStyle(fontSize: 16),
                    )),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Container(
                      alignment: Alignment.bottomCenter,
                      child: InkResponse(
                        onTap: () {},
                        child: const Divider(
                          color: Colors.black,
                        ),
                      )),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
