import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:samaya_hotel/access/access_page.dart';
import 'package:samaya_hotel/account/account_page.dart';
import 'package:samaya_hotel/account/forgot_password.dart';
import 'package:samaya_hotel/account/profil_page.dart';
import 'package:samaya_hotel/account/register_page.dart';
import 'package:samaya_hotel/dialog/page_view.dart';
import 'package:samaya_hotel/home/home_page.dart';
import 'package:samaya_hotel/home/home_reservation.dart';
import 'package:samaya_hotel/home/reservation_detail.dart';
import 'package:samaya_hotel/home/reservation_summary.dart';
import 'package:samaya_hotel/landing_page.dart';
import 'bottom_nav.dart';
import 'home/reservation_room.dart';
import 'myOrder/myorder_page.dart';
import 'dialog/exit_dialog.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Orderan(),
      title: 'Samaya Hotel',
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
    );
  }
}

