import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:samaya_hotel/bottom_navbar.dart';
import 'package:samaya_hotel/splashscreen1.dart';
import 'bottom_nav.dart';
import 'http_overrides.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();

  //kunci potrait device
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const BottomNavbar(),
      title: 'Samaya Hotel',
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
    );
  }
}


