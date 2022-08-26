import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:samaya_hotel/home/reservation_detail.dart';
import 'package:samaya_hotel/model/add_item.dart';
import 'package:samaya_hotel/model/faclities.dart';
import 'package:samaya_hotel/model/singleton_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../model/hotel_room.dart';

class HomeReservation extends StatefulWidget {
  final String? cekin;
  final String selectedItem; //data lokasi hotel pilihan
  final int? guest;
  final int? room;
  final String? cekout;

  HomeReservation(
      {Key? key,
      required this.cekin,
      required this.cekout,
      required this.guest,
      required this.room,
      required this.selectedItem})
      : super(key: key);

  @override
  State<HomeReservation> createState() => _HomeReservationState();
}

int activeIndex = 0;

class _HomeReservationState extends State<HomeReservation> {
  late List<Facilities> _facilitiesImg;
  late List<HotelRoom> _hotelrooms;
  late PageController _controllerPage;
  late ScrollController _scrollController;
  late SingletonModel _model;
  String? _selectedItem;
  String? _cekin;
  String? _cekout;
  int? _guest;
  int? _room;
  final urlImages = [
    'images/hotels/landingimages4.jpg',
    'images/hotels/hotelloby.jpg',
    'images/hotels/hotelroom.jpg',
  ];

  @override
  void initState() {
    super.initState();
    _cekout = widget.cekout;
    _cekin = widget.cekin;
    _guest = widget.guest;
    _room = widget.room;
    _selectedItem = widget.selectedItem;
    _model = SingletonModel.withContext(context);
    _model.addItem = [];
    _facilitiesImg = [
      Facilities(
          image: 'images/facilities/playground.jpg', name: 'Swimming Pool'),
      Facilities(image: 'images/facilities/relaxroom.jpg', name: 'Relax Room'),
      Facilities(image: 'images/facilities/rooftop.jpg', name: 'Rooftop'),
    ];

    _hotelrooms = [
      HotelRoom(
        id: 0,
        name: 'Superior King Bed Room',
        bed: 'King Bed',
        maxPerson: 'Max 2 Guest, 2 Children',
        price: 450000,
        refund: 'Non Refundable',
        images: 'images/hotels/hotelroom.jpg',
      ),
      HotelRoom(
        id: 1,
        name: 'Prime King Bed Room',
        bed: 'King Bed',
        maxPerson: 'Max 2 Guest, 2 Children',
        price: 550000,
        refund: 'Non Refundable',
        images: 'images/hotels/hotelroom.jpg',
      ),
      HotelRoom(
        id: 2,
        name: 'Deluxe King Bed Room',
        bed: 'King Bed',
        maxPerson: 'Max 2 Guest, 2 Children',
        price: 650000,
        refund: 'Non Refundable',
        images: 'images/hotels/hotelroom.jpg',
      ),
      HotelRoom(
        id: 3,
        name: 'Junior King Bed Room',
        bed: 'King Bed',
        maxPerson: 'Max 2 Guest, 2 Children',
        price: 750000,
        refund: 'Non Refundable',
        images: 'images/hotels/hotelroom.jpg',
      ),
      HotelRoom(
        id: 4,
        name: 'Suite King Bed Room',
        bed: 'King Bed',
        maxPerson: 'Max 2 Guest, 2 Children',
        price: 850000,
        refund: 'Non Refundable',
        images: 'images/hotels/hotelroom.jpg',
      ),
    ];
    _scrollController = ScrollController();
    _controllerPage = PageController();
    _scrollController.addListener(() {
      if (_scrollController.offset >=
              _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange) {
        _controllerPage.nextPage(
            duration: const Duration(seconds: 1), curve: Curves.ease);
      }
      if (_scrollController.offset <=
              _scrollController.position.minScrollExtent &&
          !_scrollController.position.outOfRange) {
        _controllerPage.previousPage(
            duration: const Duration(seconds: 1), curve: Curves.ease);
      }
    });
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      _cekin = 'On ${DateFormat('d MMMM yyyy').format(args.value.startDate)}';
      _cekout = DateFormat('d MMMM yyyy')
          .format(args.value.endDate ?? args.value.startDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: //menghilangkan padding top
          MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Stack(
          children: [
            PageView(
              controller: _controllerPage,
              scrollDirection: Axis.vertical,
              children: [_homeReservation(), _reservationRoom()],
            ),
            if (_model.addItem!.isNotEmpty)
              Positioned(bottom: 0, left: 10, right: 10, child: _selectedRoom())
          ],
        ),
      ),
    );
  }

  //pilih tanggal
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
                  rangeSelectionColor: Colors.deepPurple.withOpacity(0.2),
                  todayHighlightColor: Colors.deepPurple,
                  startRangeSelectionColor: Colors.deepPurple,
                  endRangeSelectionColor: Colors.deepPurple,
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

  void _editRoomGuest() {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              child: _buildButtonEditRoom(),
            ),
            Container(
              child: _buildButtonEditGuest(),
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    _room;
                    _guest;
                  });
                  Navigator.pop(context);
                },
                child: const Text('Save'),
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

  Widget _buildButtonEditRoom() {
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
                        color: Colors.deepPurple,
                      ),
                    ),
                    Positioned(
                      right: 10,
                      top: 10,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            if (_room != null) {
                              _room = _room! + 1;
                            }
                          });
                        },
                        child: const Icon(
                          Icons.keyboard_arrow_up,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 10,
                      bottom: 10,
                      child: InkWell(
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
                          color: Colors.deepPurple,
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

  Widget _buildButtonEditGuest() {
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
                        Icons.person,
                        color: Colors.deepPurple,
                      ),
                    ),
                    Positioned(
                      right: 10,
                      top: 10,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            if (_guest != null) {
                              _guest = _guest! + 1;
                            }
                          });
                        },
                        child: const Icon(
                          Icons.keyboard_arrow_up,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
                    Positioned(
                        right: 10,
                        bottom: 10,
                        child: InkWell(
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
                              color: Colors.deepPurple,
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

  //image hotel carousel slider
  Widget buildImage(String urlImage, int index) => SizedBox(
        width: double.infinity,
        child: Image.asset(urlImage, fit: BoxFit.cover),
      );

  //index image carausel
  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: urlImages.length,
        effect: const JumpingDotEffect(
          activeDotColor: Colors.deepPurple,
          dotColor: Colors.black12,
          dotHeight: 10,
          dotWidth: 10,
        ),
      );

  //home reservation page
  Widget _homeReservation() {
    return ListView(
      controller: _scrollController,
      scrollDirection: Axis.vertical,
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
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: SizedBox(
                                  height: 30,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      const Padding(
                                        padding: EdgeInsets.only(left: 8.0),
                                        child: Icon(
                                          Icons.calendar_month_outlined,
                                          color: Colors.deepPurple,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 6.0),
                                        child: Text(
                                          _cekin!,
                                          style: const TextStyle(fontSize: 18),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 6.0),
                                        child: Text(
                                          '- $_cekout',
                                          style: const TextStyle(fontSize: 18),
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                            const Spacer(),
                            InkWell(
                                onTap: () {
                                  _pressedDate();
                                },
                                child: const Padding(
                                  padding: EdgeInsets.only(right: 8.0),
                                  child: Icon(
                                    Icons.edit,
                                    color: Colors.deepPurple,
                                  ),
                                )),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: SizedBox(
                                  height: 30,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      const Padding(
                                        padding: EdgeInsets.only(left: 8.0),
                                        child: Icon(
                                          Icons.bed,
                                          color: Colors.deepPurple,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 6.0),
                                        child: Text(
                                          '$_room Room, $_guest Guest',
                                          style: const TextStyle(fontSize: 18),
                                        ),
                                      ),
                                    ],
                                  ),
                              ),
                            ),
                            const Spacer(),
                            InkWell(
                                onTap: () {
                                  _editRoomGuest();
                                },
                                child: const Padding(
                                  padding: EdgeInsets.only(right: 8.0),
                                  child: Icon(Icons.edit,
                                      color: Colors.deepPurple),
                                )),
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
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SizedBox(
                    child: Row(
                      children: const [
                        Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                          size: 15,
                        ),
                        Text(
                          'Hotel',
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
          height: 10,
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CarouselSlider.builder(
                  itemCount: urlImages.length,
                  itemBuilder: (context, index, realIndex) {
                    final urlImage = urlImages[index];
                    return buildImage(urlImage, index);
                  },
                  options: CarouselOptions(
                    height: 245,
                    enlargeCenterPage: false,
                    viewportFraction: 1,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 2),
                    onPageChanged: (index, reason) =>
                        setState(() => activeIndex = index),
                  )),
              const SizedBox(height: 5),
              buildIndicator(),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 200,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _selectedItem!,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w700),
                ),
                const Divider(color: Colors.black, thickness: 2),
                const Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
          child: Text(
            'Location',
            style: TextStyle(fontSize: 16),
          ),
        ),
        Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
            child: Container(
              color: Colors.red,
              width: double.infinity,
              height: 200,
              child: Image.asset(
                'images/location.png',
                fit: BoxFit.cover,
              ),
            )),
        const Padding(
          padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
          child: Text(
            'Facilites',
            style: TextStyle(fontSize: 16),
          ),
        ),
        _facilities(),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }

  //facilities image
  Widget _facilities() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 10),
      child: SizedBox(
        height: 130,
        width: double.infinity,
        child: ListView.builder(
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {},
              child: Row(
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
                              child: InkWell(
                                onTap: () {},
                                child: Stack(children: <Widget>[
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.asset(
                                          _facilitiesImg[index].image!,
                                          fit: BoxFit.cover,
                                          width: double.infinity)),
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
                                        padding:
                                            const EdgeInsets.only(left: 18),
                                        child: Text(
                                          _facilitiesImg[index].name!,
                                          style: const TextStyle(
                                              color: Colors.amber,
                                              fontSize: 20),
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
          itemCount: _facilitiesImg.length,
        ),
      ),
    );
  }

  //room reservation page
  Widget _reservationRoom() {
    return ListView(
      controller: _scrollController,
      scrollDirection: Axis.vertical,
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
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      const Padding(
                                        padding: EdgeInsets.only(left: 8.0),
                                        child: Icon(
                                          Icons.calendar_month_outlined,
                                          color: Colors.deepPurple,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 6.0),
                                        child: Text(
                                          _cekin!,
                                          style: const TextStyle(fontSize: 18),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 6.0),
                                        child: Text(
                                          '- $_cekout',
                                          style: const TextStyle(fontSize: 18),
                                        ),
                                      ),
                                    ],
                                  ),
                              ),
                            ),
                            const Spacer(),
                            InkWell(
                                onTap: () {
                                  _pressedDate();
                                },
                                child: const Padding(
                                  padding: EdgeInsets.only(right: 8.0),
                                  child: Icon(
                                    Icons.edit,
                                    color: Colors.deepPurple,
                                  ),
                                )),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: SizedBox(
                                  height: 30,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      const Padding(
                                        padding: EdgeInsets.only(left: 8.0),
                                        child: Icon(
                                          Icons.bed,
                                          color: Colors.deepPurple,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 6.0),
                                        child: Text(
                                          '$_room Room, $_guest Guest',
                                          style: const TextStyle(fontSize: 18),
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                            const Spacer(),
                            InkWell(
                                onTap: () {
                                  _editRoomGuest();
                                },
                                child: const Padding(
                                  padding: EdgeInsets.only(right: 8.0),
                                  child: Icon(
                                    Icons.edit,
                                    color: Colors.deepPurple,
                                  ),
                                )),
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
                child: InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondAnimation) =>
                            HomeReservation(
                                cekin: widget.cekin,
                                cekout: widget.cekout,
                                guest: widget.guest,
                                room: widget.room,
                                selectedItem: widget.selectedItem),
                        transitionDuration: const Duration(milliseconds: 1000),
                        transitionsBuilder:
                            (context, animation, secondAnimation, child) {
                          const begin = Offset(0.0, 1.0);
                          const end = Offset.zero;
                          const curve = Curves.easeIn;

                          var tween = Tween(begin: begin, end: end)
                              .chain(CurveTween(curve: curve));

                          return SlideTransition(
                            position: animation.drive(tween),
                            child: child,
                          );
                        },
                      ),
                    );
                    // Navigator.pop(context);
                  },
                  child: Row(
                    children: const [
                      Icon(
                        Icons.arrow_back_ios_new,
                        size: 15,
                        color: Colors.white,
                      ),
                      Text(
                        'Room',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ],
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
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  height: 170,
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
                            ),
                          ),
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
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  const Icon(Icons.bed,
                                      color: Colors.deepPurple),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(_hotelrooms[index].bed!),
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
                                  Text(_hotelrooms[index].refund!)
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
                                  Text(_hotelrooms[index].maxPerson!),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      6,
                                      0,
                                      MediaQuery.of(context).size.width * 0.15,
                                      0),
                                  child: Text(
                                    NumberFormat.currency(
                                            locale: 'id',
                                            symbol: 'IDR ',
                                            decimalDigits: 0)
                                        .format(_hotelrooms[index].price!),
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ),
                                _model.addItem!
                                        .where((element) =>
                                            element.item.id ==
                                            _hotelrooms[index].id)
                                        .isEmpty
                                    ? Container(
                                        height: 30,
                                        width: 60,
                                        decoration: BoxDecoration(
                                          color: Colors.deepPurple,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: InkWell(
                                          onTap: () => setState(() {
                                            _model.addItem!.add(AddItem(
                                                item: _hotelrooms[index],
                                                jumlahItem: 1));
                                          }),
                                          child: const Center(
                                            child: Text(
                                              "Select",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    : Column(
                                        children: [
                                          Row(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  AddItem select = _model
                                                      .addItem!
                                                      .where((element) =>
                                                          element.item.id ==
                                                          _hotelrooms[index].id)
                                                      .first;
                                                  setState(() {
                                                    if (select.jumlahItem ==
                                                        1) {
                                                      _model.addItem!
                                                          .removeWhere(
                                                              (element) =>
                                                                  element.item
                                                                      .id ==
                                                                  _hotelrooms[
                                                                          index]
                                                                      .id);
                                                    } else {
                                                      _model.addItem!
                                                          .where((element) =>
                                                              element.item.id ==
                                                              _hotelrooms[index]
                                                                  .id)
                                                          .first
                                                          .jumlahItem--;
                                                    }
                                                  });
                                                },
                                                child: Container(
                                                  height: 25,
                                                  width: 25,
                                                  decoration:
                                                      const BoxDecoration(
                                                          color:
                                                              Colors.deepPurple,
                                                          shape:
                                                              BoxShape.circle),
                                                  child: const Center(
                                                    child: Icon(
                                                      Icons.arrow_left,
                                                      size: 25,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  "${_model.addItem!.where((element) => element.item.id == _hotelrooms[index].id).first.jumlahItem}",
                                                  style: const TextStyle(
                                                      fontSize: 16),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    _model.addItem!
                                                        .where((element) =>
                                                            element.item.id ==
                                                            _hotelrooms[index]
                                                                .id)
                                                        .first
                                                        .jumlahItem++;
                                                  });
                                                },
                                                child: Container(
                                                  height: 25,
                                                  width: 25,
                                                  decoration:
                                                      const BoxDecoration(
                                                          color:
                                                              Colors.deepPurple,
                                                          shape:
                                                              BoxShape.circle),
                                                  child: const Center(
                                                    child: Icon(
                                                      Icons.arrow_right,
                                                      size: 25,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ));
          },
          itemCount: _hotelrooms.length,
        ),
        const SizedBox(
          height: 60,
          child: Center(
              child: Text(
            'No more data',
            style: TextStyle(color: Colors.grey),
          )),
        ),
      ],
    );
  }

  //select room
  Widget _selectedRoom() {
    int price = 0;
    for (var element in _model.addItem!) {
      price += element.item.price! * element.jumlahItem;
      element.item.totalPrice = price;
    }

    int roomPrice = 0;
    for (var element in _model.addItem!) {
      roomPrice = element.item.price! * element.jumlahItem;
      element.item.selectedRoomPrice = roomPrice;
    }

    int room = 0;
    for (var element in _model.addItem!) {
      room += element.jumlahItem;
    }

    return InkWell(
      onTap: () async {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ReservationDetail(
              room: widget.room!,
              guest: widget.guest!,
              cekin: widget.cekin!,
              cekout: widget.cekout!,
              selectedItem: widget.selectedItem,
            ),
          ),
        );
        setState(() {
          _model = SingletonModel.shared;
        });
      },
      child: Column(
        children: [
          Container(
            height: 55,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    '$room Room Selected',
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Text(
                    NumberFormat.currency(locale: 'id', symbol: 'IDR ', decimalDigits: 0).format(price),
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
