import 'package:flutter/material.dart';
import 'package:samaya_hotel/access/access_page.dart';
import 'package:samaya_hotel/account/account_page.dart';
import 'package:samaya_hotel/dialog/exit_dialog.dart';
import 'package:samaya_hotel/home/home_page.dart';

import 'myOrder/myorder_page.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
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
        body: Container(
            width: double.infinity,
            color: Colors.red,
            child: body[currentIndex]),
        bottomNavigationBar: BottomNavigationBar(
          onTap: clicked,
          currentIndex: currentIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_filled, color: Colors.deepPurple),
                label: 'Home',
                activeIcon: Icon(
                  Icons.home,
                  color: Colors.amberAccent,
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_balance_wallet_sharp,
                    color: Colors.deepPurple),
                label: 'Home',
                activeIcon: Icon(
                  Icons.account_balance_wallet_outlined,
                  color: Colors.amberAccent,
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.access_time_filled, color: Colors.deepPurple),
                label: 'Home',
                activeIcon: Icon(
                  Icons.access_time,
                  color: Colors.amberAccent,
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle, color: Colors.deepPurple),
                label: 'Home',
                activeIcon: Icon(
                  Icons.account_circle_outlined,
                  color: Colors.amberAccent,
                )),
          ],
        ),
      ),
    );
  }

  void clicked(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
