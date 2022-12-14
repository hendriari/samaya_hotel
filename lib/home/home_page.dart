import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:samaya_hotel/model/promotion.dart';
import 'package:samaya_hotel/model/vacation.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

import 'home_reservation.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  late List<Vacation> _hiling;
  late List<Promotion> _promo;

  String? _selectedItem;
  String? _cekin;
  String? _cekout;

  int? _guest;
  int? _room;

  @override
  void initState() {
    super.initState();
    _guest = 0;
    _room = 0;
    _promo = [
      Promotion(images: 'images/promotion/gomart.png', promo: 'Go-Mart'),
      Promotion(
          images: 'images/promotion/tempura.png',
          promo: 'Shihlin Taiwan Street'),
      Promotion(images: 'images/promotion/tiket.png', promo: 'Tiket.com'),
      Promotion(images: 'images/promotion/tokped.png', promo: 'Toko Pedia'),
    ];

    _hiling = [
      Vacation(
        images: 'images/vacation/bali.png',
        location: 'Bali',
      ),
      Vacation(
        images: 'images/vacation/bromo.png',
        location: 'Bromo',
      ),
      Vacation(
        images: 'images/vacation/labuanbajo.png',
        location: 'Labuan Bajo',
      ),
      Vacation(
        images: 'images/vacation/rajaampat.png',
        location: 'Raja Ampat',
      ),
    ];
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      _cekin = 'On ${DateFormat('d MMM y').format(args.value.startDate)}';
      _cekout = DateFormat('d MMM y')
          .format(args.value.endDate ?? args.value.startDate);
    });
  }

  void _onSearch() {
    if (_selectedItem != null && _cekin != null && _cekout != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeReservation(
            cekin: _cekin!,
            cekout: _cekout!,
            guest: _guest!,
            room: _room!,
            selectedItem: _selectedItem!,
          ),
        ),
      );
    } else {
      Fluttertoast.showToast(
          msg: "Field cannot be empty",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            /// split header
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
            _vacation(),
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
            _promotionView(),
            const SizedBox(
              height: 70,
            )
          ],
        ),
      ),
    );
  }

  //select data
  Widget _header() {
    return SizedBox(
      height: 400,
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
          const Positioned(
            top: 50,
            left: 35,
            child: Text(
              'Hi, Hendri Ari',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          Positioned(
            top: 83,
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
                                        const Icon(
                                          Icons.location_pin,
                                          color:
                                              Color.fromRGBO(107, 83, 204, 1),
                                        ),
                                        Text(
                                          _selectedItem ?? 'In ',
                                          style: const TextStyle(fontSize: 16),
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
                      ),
                    ),
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
                                        Icons.calendar_month_outlined,
                                        color: Color.fromRGBO(107, 83, 204, 1),
                                      ),
                                      Text(
                                        _cekin ?? 'On ',
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                                const Divider(
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
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
                                        Icons.calendar_month_outlined,
                                        color: Color.fromRGBO(107, 83, 204, 1),
                                      ),
                                      Text(
                                        _cekout ?? 'On ',
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                                const Divider(
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
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
                                      const Icon(
                                        Icons.bed,
                                        color: Color.fromRGBO(107, 83, 204, 1),
                                      ),
                                      Text(
                                        "$_room Room, $_guest Guest",
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                                const Divider(
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 0,
                      left: 0,
                      child: Center(
                        child: InkWell(
                          onTap: () {
                            _onSearch();
                          },
                          child: Container(
                            width: 141,
                            height: 37,
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(107, 83, 204, 1),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                      offset: Offset(2, 3),
                                      color: Colors.black38,
                                      blurRadius: 2)
                                ]),
                            child: const Center(
                              child: Text(
                                'Search',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// vacation
  Widget _vacation() {
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: ListView.builder(
        physics: const ScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
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
                        ),
                      ],
                    ),
                    child: InkResponse(
                      onTap: () {},
                      child: Stack(
                        children: <Widget>[
                          ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(_hiling[index].images!,
                                  fit: BoxFit.cover, width: double.infinity)),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.black38,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.zero,
                                    topRight: Radius.zero,
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 18),
                                child: Text(
                                  _hiling[index].location!,
                                  style: const TextStyle(
                                      color: Colors.amber, fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        itemCount: _hiling.length,
      ),
    );
  }

  /// promotion images
  Widget _promotionView() {
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: ListView.builder(
        physics: const ScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
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
                    child: InkResponse(
                      onTap: () {},
                      child: Stack(
                        children: <Widget>[
                          ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(_promo[index].images!,
                                  fit: BoxFit.cover, width: double.infinity)),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.black38,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.zero,
                                    topRight: Radius.zero,
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 18),
                                child: Text(
                                  _promo[index].promo!,
                                  style: const TextStyle(
                                      color: Colors.amber, fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        itemCount: _promo.length,
      ),
    );
  }

  /// for location hotels
  void _onButtonPressed() {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  child: _buildBottomNavigationMenu(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  /// select location hotels
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
                    decoration: InputDecoration(border: InputBorder.none),
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
                            const Icon(
                              Icons.location_pin,
                              color: Color.fromRGBO(107, 83, 204, 1),
                            ),
                            InkResponse(
                                onTap: () {},
                                child: const Icon(
                                  Icons.search,
                                  color: Color.fromRGBO(107, 83, 204, 1),
                                ))
                          ],
                        ),
                        const Divider(
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(1, 4),
                      color: Colors.black54,
                      blurRadius: 5,
                    )
                  ],
                ),
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'images/hotel.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: const Text('Hotel Samaya, Semarang'),
                  onTap: () => _selectItem('Hotel Samaya, Semarang'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(1, 4),
                      color: Colors.black54,
                      blurRadius: 5,
                    )
                  ],
                ),
                child: ListTile(
                  leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset('images/hotel.png')),
                  title: const Text('Hotel Samaya, Kab. Semarang'),
                  onTap: () => _selectItem('Hotel Samaya, Kab. Semarang'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(1, 4),
                      color: Colors.black54,
                      blurRadius: 5,
                    )
                  ],
                ),
                child: ListTile(
                  leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset('images/hotel.png')),
                  title: const Text('Hotel Samaya, Klaten'),
                  onTap: () => _selectItem('Hotel Samaya, Klaten'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(1, 4),
                      color: Colors.black54,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: ListTile(
                  leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset('images/hotel.png')),
                  title: const Text('Hotel Samaya, Solo'),
                  onTap: () => _selectItem('Hotel Samaya, Solo'),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
              child: Center(
                child: Text(
                  'No more data',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ],
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

  /// select date
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
                todayHighlightColor: const Color.fromRGBO(107, 83, 204, 1),
                startRangeSelectionColor: const Color.fromRGBO(107, 83, 204, 1),
                endRangeSelectionColor: const Color.fromRGBO(107, 83, 204, 1),
                rangeSelectionColor:
                    const Color.fromRGBO(107, 83, 204, 1).withOpacity(0.1),
                selectionMode: DateRangePickerSelectionMode.range,
                initialSelectedRange: PickerDateRange(
                    DateTime.now().subtract(const Duration(days: 0)),
                    DateTime.now().add(const Duration(days: 0))),
              ),
            )
          ],
        );
      },
    );
  }

  void _onSelectionRoom() {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              child: _buildButtonSelectionRoom(),
            ),
            Container(
              child: _buildButtonSelectionGuest(),
            ),
            Center(
              child: InkWell(
                onTap: () {
                  setState(() {
                    _guest;
                    _room;
                  });
                  Navigator.pop(context);
                },
                child: Container(
                  width: 141,
                  height: 37,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(107, 83, 204, 1),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(2, 3),
                            color: Colors.black38,
                            blurRadius: 2)
                      ]),
                  child: const Center(
                    child: Text(
                      'Save',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        );
      },
    );
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
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: SizedBox(
            height: 60,
            width: double.infinity,
            child: StatefulBuilder(
              builder: (context, setState) {
                return Stack(
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
                      child: Icon(
                        Icons.bed,
                        color: Color.fromRGBO(107, 83, 204, 1),
                      ),
                    ),
                    Positioned(
                      right: 10,
                      top: 10,
                      child: InkResponse(
                        onTap: () {
                          setState(() {
                            if (_room != null) {
                              _room = _room! + 1;
                            }
                          });
                        },
                        child: const Icon(
                          Icons.keyboard_arrow_up,
                          color: Color.fromRGBO(107, 83, 204, 1),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 10,
                      bottom: 10,
                      child: InkResponse(
                        onTap: () {
                          setState(() {
                            var r = _room;
                            if (r != null && r >= 1) {
                              r--;
                            }
                            _room = r;
                          });
                        },
                        child: const Icon(
                          Icons.keyboard_arrow_down,
                          color: Color.fromRGBO(107, 83, 204, 1),
                        ),
                      ),
                    ),
                    Positioned(left: 40, top: 25, child: Text('$_room')),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        child: const Divider(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                );
              },
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
            child: StatefulBuilder(
              builder: (context, setState) {
                return Stack(
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
                      child: Icon(
                        Icons.group,
                        color: Color.fromRGBO(107, 83, 204, 1),
                      ),
                    ),
                    Positioned(
                      right: 10,
                      top: 10,
                      child: InkResponse(
                        onTap: () {
                          setState(() {
                            if (_guest != null) {
                              _guest = _guest! + 1;
                            }
                          });
                        },
                        child: const Icon(
                          Icons.keyboard_arrow_up,
                          color: Color.fromRGBO(107, 83, 204, 1),
                        ),
                      ),
                    ),
                    Positioned(
                        right: 10,
                        bottom: 10,
                        child: InkResponse(
                            onTap: () {
                              setState(() {
                                var g = _guest;
                                if (g != null && g >= 1) {
                                  g--;
                                }
                                _guest = g;
                              });
                            },
                            child: const Icon(
                              Icons.keyboard_arrow_down,
                              color: Color.fromRGBO(107, 83, 204, 1),
                            ))),
                    Positioned(
                      left: 40,
                      top: 25,
                      child: Text(
                        "$_guest",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Container(
                          alignment: Alignment.bottomCenter,
                          child: const Divider(
                            color: Colors.black,
                          )),
                    ),
                  ],
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
