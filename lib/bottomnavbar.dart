import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:samaya_hotel/access/access_page.dart';
import 'package:samaya_hotel/account/account_page.dart';
import 'package:samaya_hotel/home/home_page.dart';
import 'package:samaya_hotel/myOrder/myorder_page.dart';

import 'dialog/exit_dialog.dart';

class BottomNavigationBars extends StatefulWidget {
  const BottomNavigationBars({Key? key}) : super(key: key);

  @override
  BottomNavigationBarsState createState() => BottomNavigationBarsState();
}

class BottomNavigationBarsState extends State<BottomNavigationBars> {
  int currentbody = 0;
  final List<Widget> body = [
    const HomePage(),
    const Orderan(),
    const AccessPage(),
    const AccountPage(),
  ];

  Future<bool> _onWillPop() async {
    if (currentbody > 0) {
      setState(() {
        currentbody = 0;
      });
      return Future(() => false);
    } else {
      bool exitWae = await openDialogExit(context) ?? false;
      if (exitWae) {
        setState(() {
          exitWae = true;
        });
      }
      return Future(() => exitWae);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        extendBody: true,
        body: body[currentbody],
        bottomNavigationBar: _navbar(context),
      ),
    );
  }

  Container _navbar(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    return Container(
      margin:
          EdgeInsets.fromLTRB(displayWidth * .05, 0, displayWidth * .05, 15),
      // height: displayWidth * .155,
      height: 60,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(107, 83, 204, 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.1),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
        borderRadius: BorderRadius.circular(50),
      ),
      child: ListView.builder(
        itemCount: body.length,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: displayWidth * .02),
        itemBuilder: (context, body) => InkWell(
          onTap: () {
            setState(() {
              currentbody = body;
              HapticFeedback.lightImpact();
            });
          },
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Stack(
            children: [
              AnimatedContainer(
                duration: const Duration(seconds: 1),
                curve: Curves.fastLinearToSlowEaseIn,
                width: body == currentbody
                    ? displayWidth * .32
                    : displayWidth * .18,
                alignment: Alignment.center,
                child: AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  height: 45,
                  width: body == currentbody ? displayWidth * .32 : 0,
                  decoration: BoxDecoration(
                    color: body == currentbody
                        ? Colors.white.withOpacity(.2)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              AnimatedContainer(
                duration: const Duration(seconds: 1),
                curve: Curves.fastLinearToSlowEaseIn,
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    Row(
                      children: [
                        AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          curve: Curves.fastLinearToSlowEaseIn,
                          width: body == currentbody ? displayWidth * .15 : 0,
                        ),
                        AnimatedOpacity(
                          opacity: body == currentbody ? 1 : 0,
                          duration: const Duration(seconds: 1),
                          curve: Curves.fastLinearToSlowEaseIn,
                          child: Text(
                            body == currentbody ? listOfStrings[body] : '',
                            style: const TextStyle(
                              color: Colors.amber,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          curve: Curves.fastLinearToSlowEaseIn,
                          width: 30,
                        ),
                        Icon(
                          listOfIcons[body],
                          size: 30,
                          color: body == currentbody
                              ? Colors.amberAccent
                              : Colors.black26,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<IconData> listOfIcons = [
    Icons.home_filled,
    Icons.task_alt,
    Icons.smartphone,
    Icons.person_rounded,
  ];

  List<String> listOfStrings = [
    'Home',
    'My Order',
    'Access',
    'Account',
  ];
}
