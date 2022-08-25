import 'package:flutter/material.dart';
import 'package:samaya_hotel/model/add_item.dart';
import 'package:samaya_hotel/model/hotel_room.dart';

class SingletonModel {
  static final SingletonModel _singleton = SingletonModel._internal();

  factory SingletonModel() {
    return _singleton;
  }

  SingletonModel._internal();

  static SingletonModel withContext(BuildContext context) {
    _singleton.context = context;
    return _singleton;
  }

  static SingletonModel get shared => _singleton;

  late BuildContext? context;
  AddItem? addItem;
  List<HotelRoom>? hotelModel;
}
