import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'access/access_page.dart';
import 'account/account_page.dart';
import 'dialog/exit_dialog.dart';
import 'home/home_page.dart';
import 'myOrder/myorder_page.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({Key? key}) : super(key: key);

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int currentIndex = 0;

  final List<Widget> body = [
    const HomePage(),
    const Orderan(),
    const AccessPage(),
    const AccountPage(),
  ];

  Future<bool> _onWillPop() async {
    if (currentIndex > 0) {
      setState(() {
        currentIndex = 0;
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
        body: body[currentIndex],
        bottomNavigationBar: _navBar(context),


      ),
    );
  }

  Container _navBar(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 15),
        child: Container(
          height: 70,
          decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  offset: Offset(1,2),
                  color: Colors.deepPurpleAccent,
                  blurRadius: 2,
                )
              ]
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(25,10,0,10),
                child: InkResponse(
                  onTap: (){
                    setState((){
                      currentIndex = 0;
                    });
                  },
                  child: Column(
                    children: [
                      SvgPicture.asset('images/navbarIcon/home.svg'),
                      Text('Home', style: TextStyle(color: Colors.white),),
                    ],
                  ),
                )
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,10,0,10),
                child: InkResponse(
                  onTap: (){
                    setState((){
                      currentIndex = 1;
                    });
                  },
                  child: Column(
                    children: [
                      SvgPicture.asset('images/navbarIcon/home.svg'),
                      Text('My Order',style: TextStyle(color: Colors.white),),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: InkResponse(
                  onTap: (){
                    setState((){
                      currentIndex = 2;
                    });
                  },
                  child: Column(
                    children: [
                      SvgPicture.asset('images/navbarIcon/home.svg'),
                      Text('Access',style: TextStyle(color: Colors.white),),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,10,25,10),
                child: InkResponse(
                  onTap: (){
                    setState((){
                      currentIndex = 3;
                    });
                  },
                  child: Column(
                    children: [
                      SvgPicture.asset('images/navbarIcon/home.svg'),
                      Text('My Order',style: TextStyle(color: Colors.white),),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
