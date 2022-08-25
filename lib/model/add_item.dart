import 'package:samaya_hotel/model/hotel_room.dart';

class AddItem {
  late List<HotelRoom> item;

  String? cekin;
  String? cekout;

  AddItem({
    required this.item,

    this.cekin,
    this.cekout
  });
}
