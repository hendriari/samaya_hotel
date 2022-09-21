import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AccessPage extends StatefulWidget {
  const AccessPage({Key? key}) : super(key: key);

  @override
  State<AccessPage> createState() => _AccessPage();
}

class _AccessPage extends State<AccessPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool? _anim;
  String? _status;

  @override
  void initState() {
    super.initState();
    _anim = false;
    _status = 'Tap to Unlock Room';
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 180,
              width: double.infinity,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    child: Container(
                      height: 100,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(107, 83, 204, 1),
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.elliptical(50, 30),
                          bottomLeft: Radius.elliptical(50, 30),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 83,
                    left: 0,
                    right: 0,
                    child: Align(
                      child: Container(
                        height: 82,
                        width: 350,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black54,
                              offset: Offset(1, 4),
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text(
                                'Hotel Samaya, Semarang',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 16),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    child: Row(
                                      children: const [
                                        Icon(
                                          Icons.calendar_month_outlined,
                                          color:
                                              Color.fromRGBO(107, 83, 204, 1),
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          '1 July 2022 - 31 July 2022',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    child: Row(
                                      children: const [
                                        Icon(
                                          Icons.bed,
                                          color:
                                              Color.fromRGBO(107, 83, 204, 1),
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          'Room 0311',
                                          style: TextStyle(fontSize: 12),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 50,
                    left: 35,
                    child: Text(
                      'Access',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            GestureDetector(
              onTap:
                  // _onLoading
                  () async {
                setState(() {
                  _anim = true;
                  _status = 'Proccess';
                });
                await Future.delayed(const Duration(milliseconds: 1000));
                setState(() {
                  _anim = true;
                  _status = 'Success';
                });
                await Future.delayed(
                  const Duration(milliseconds: 1000),
                );
                setState(
                  () {
                    _anim = false;
                    _status = 'Tap to Unlock Room';
                  },
                );
              },
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.35,
                    child: _anim!
                        ? Lottie.asset('images/assets/unlock2.json')
                        : Lottie.asset(
                            'images/assets/unlock2.json',
                            controller: _animationController,
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
                    child: Text(
                      _status!,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
