import 'dart:io';

//file import yang ga dipake, clear aja
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:samaya_hotel/bottomnavbar.dart';
import 'package:samaya_hotel/home/home_page.dart';
import 'package:samaya_hotel/splashscreen1.dart';
import 'package:samaya_hotel/unUsed/bottom_navbar.dart';
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
      home: SplashScreen1(),
      title: 'Samaya Hotel',
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
    );
  }
}


