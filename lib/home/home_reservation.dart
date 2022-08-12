import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeReservation extends StatefulWidget {
  final String date;

  HomeReservation({required this.date});

  @override
  State<HomeReservation> createState() => _HomeReservationState();
}

int activeIndex = 0;

final urlImages = [
  'images/hotels/landingimages4.jpg',
  'images/hotels/hotelloby.jpg',
  'images/hotels/hotelroom.jpg',
];

class _HomeReservationState extends State<HomeReservation> {
  String? _range;

  @override
  void initState() {
    super.initState();
    _range = widget.date;
  }

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
                                              _range!,
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
                  children: const [
                    Text(
                      'Hotel Samaya, Semarang',
                      style: TextStyle(fontSize: 16),
                    ),
                    Divider(color: Colors.black, thickness: 2),
                    Text(
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
                )),
            const Padding(
              padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
              child: Text(
                'Facilites',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 10),
              child: Container(
                height: 130,
                width: double.infinity,
                child: ListView(
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 1, 5, 1),
                          child: Container(
                            height: 100,
                            width: 200,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: const [
                                  BoxShadow(
                                    offset: Offset(1, 4),
                                    color: Colors.black54,
                                    blurRadius: 5,
                                  )
                                ]),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                'images/facilities/relaxroom.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 1, 5, 1),
                          child: Container(
                            height: 100,
                            width: 200,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: const [
                                  BoxShadow(
                                    offset: Offset(1, 4),
                                    color: Colors.black54,
                                    blurRadius: 5,
                                  )
                                ]),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                'images/facilities/playground.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.fromLTRB(5, 1, 5, 1),
                            child: Container(
                              height: 100,
                              width: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: const [
                                    BoxShadow(
                                      offset: Offset(1, 4),
                                      color: Colors.black54,
                                      blurRadius: 5,
                                    )
                                  ]),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                    'images/facilities/rooftop.jpg',
                                    fit: BoxFit.cover),
                              ),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
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

  Widget buildImage(String urlImage, int index) => SizedBox(
        width: double.infinity,
        child: Image.asset(urlImage, fit: BoxFit.cover),
      );

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
}
