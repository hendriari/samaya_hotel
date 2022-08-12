// import 'package:flutter/material.dart';
// import 'package:samaya_hotel/access/access_page.dart';
// import 'package:samaya_hotel/account/account_page.dart';
// import 'package:samaya_hotel/home/home_page.dart';
// import 'package:samaya_hotel/myOrder/myorder_page.dart';
//
// //
// class MenuPage extends StatefulWidget {
//   final int page;
//
//   MenuPage({required this.page});
//
//   @override
//   State<MenuPage> createState() => _MenuPageState();
// }
//
// class _MenuPageState extends State<MenuPage> {
//   late int _page;
//   late GlobalKey<ScaffoldState> _key;
//
//   @override
//   void initState() {
//     super.initState();
//     _page = widget.page;
//     _key = GlobalKey();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _key,
//       body: _buildBody(_page),
//       bottomSheet: _bottomSheet(),
//     );
//   }
//
//   Widget _buildBody(int page) {
//     return <Widget>[
//       HomePage(),
//       AccessPage(),
//       Orderan(),
//       AccountPage(),
//     ].toList()[page];
//
//   }
//   Widget _bottomSheet(){
//     return <Widget> [
//       BottomNavigationBar(
//           Container(
//             width: double.infinity,
//             child: Center(
//               child: Stack(
//                 children: <Widget>[
//                   Positioned(
//                     child: Center(
//                       child: Container(
//                         height: 70,
//                         width: 370,
//                         decoration: BoxDecoration(
//                           color: Colors.deepPurple,
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: Center(
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: <Widget>[
//                               Container(
//                                 height: 50,
//                                 width: 50,
//                                 color: Colors.red,
//                                 child: Column(
//                                   children: <Widget>[
//                                     Center(child: Image.asset('images/iconHome.png')),
//                                     const Text(
//                                       'Home',
//                                       style: TextStyle(color: Colors.white),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Container(
//                                 color: Colors.green,
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(12.0),
//                                   child: InkWell(
//                                     onTap: () {},
//                                     child: Column(
//                                       children: [
//                                         Image.asset('images/iconHome.png'),
//                                         const Text('MyOrder',
//                                             style:
//                                             TextStyle(color: Colors.white))
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               Container(
//                                 color: Colors.blue,
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(12.0),
//                                   child: InkWell(
//                                     onTap: () {
//                                       Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                               builder: (context) =>
//                                               const AccessPage()));
//                                     },
//                                     child: Column(
//                                       children: [
//                                         Image.asset('images/iconHome.png'),
//                                         const Text('Access',
//                                             style:
//                                             TextStyle(color: Colors.white))
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               Container(
//                                 color: Colors.yellow,
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(12.0),
//                                   child: Column(
//                                     children: [
//                                       Image.asset('images/iconHome.png'),
//                                       const Text(
//                                         'Account',
//                                         style: TextStyle(color: Colors.white),
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//       ),
//     ].toList();
// }
// }
