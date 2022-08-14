import 'package:flutter/material.dart';
import 'package:samaya_hotel/home/home_reservation.dart';
import 'package:samaya_hotel/home/reservation_room.dart';

class ViewPages extends StatefulWidget {
 final String date;

 const ViewPages({required this.date});

  @override
  State<ViewPages> createState() => _ViewPagesState();

}

class _ViewPagesState extends State<ViewPages> {
  final PageController _controllerPage = PageController(initialPage: 0);

  @override
  void dispose() {
    _controllerPage.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controllerPage,
      scrollDirection: Axis.horizontal,
      children:[
        HomeReservation(date: widget.date),
        const ReservationRoom(),
      ],
    );
  }
}
