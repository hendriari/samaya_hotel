import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AccessPage extends StatefulWidget {
  const AccessPage({Key? key}) : super(key: key);

  @override
  _AccessPage createState() => _AccessPage();
}



class _AccessPage extends State<AccessPage> {
  late final width = MediaQuery.of(context).size.width;
  bool click = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 180,
              width: double.infinity,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    child: Container(
                      height: 120,
                      width: MediaQuery.of(context).size.width * 1,
                      child: SvgPicture.asset(
                        'images/rectangle1.svg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 90,
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
                                // blurStyle: BlurStyle.outer,
                                color: Colors.black54,
                                offset: Offset(1, 4),
                                blurRadius: 5,
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              const Positioned(
                                top: 10,
                                left: 10,
                                child: Text(
                                  'Hotel Samaya, Semarang',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 16),
                                ),
                              ),
                              Positioned(
                                top: 30,
                                left: 10,
                                child: SizedBox(
                                  child: Row(
                                    children: const [
                                      Icon(Icons.calendar_month_outlined),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text('1 July 2022 - 31 July 2022'),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                  top: 30,
                                  right: 10,
                                  child: SizedBox(
                                    child: Row(
                                      children: const [
                                        Icon(Icons.bed),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text('Room 0311')
                                      ],
                                    ),
                                  ))
                            ],
                          )),
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
        const SizedBox(
          height: 100,),

            // mentahan
            GestureDetector(
              onTap: (){
                setState((){

                });
              },
              child: AnimatedAlign(
                alignment: Alignment.center,
                duration: Duration(milliseconds: 300),
                child: Container(
                  width: double.infinity,
                  height: 300,
                  color: Colors.red,
                  child: Stack(
                    children: [
                      Align(
                        child: _animatedTelu(),
                      ),

                      Align(
                        child: _animatedLoro()
                      ),
                      Align(
                          child: _animatedSiji()),
                    ],
                  ),
                ),
              ),
            ),

            // Container(
            //   width: double.infinity,
            //   height: 300,
            //   color: Colors.red,
            //   child: AnimatedAlign(
            //     duration: Duration(milliseconds: 400),
            //     alignment: Alignment.bottomRight,
            //     child: Stack(
            //       children: <Widget> [
            //         Align(
            //             child: SvgPicture.asset(
            //                 'images/svgAssets/accessImage1.svg')),
            //         Align(
            //             child: SvgPicture.asset(
            //                 'images/svgAssets/accessImage2.svg')),
            //         Align(
            //             child: SvgPicture.asset(
            //                 'images/svgAssets/accessImage3.svg')),
            //       ],
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
  Widget _animatedSiji(){
    return AnimatedSwitcher(
      duration: Duration(seconds: 1),
      child: Container(
        height: 120,
        width: 120,
        child: Stack(
          children: [
            Align(
              child: SvgPicture.asset(
                  'images/svgAssets/accessImage2.svg'),
            ),
            Align(
              child: SvgPicture.asset(
                  'images/svgAssets/accessImage1.svg'),
            ),
            Align(
              child: SvgPicture.asset(
                  'images/svgAssets/accessImage3.svg'),
            )
          ],
        ),
      ),
    );
  }

  Widget _animatedLoro(){
    return AnimatedSwitcher(
      duration: Duration(seconds: 5),
      child: Container(
        height: 160,
        width: 160,
        child: Stack(
          children: [
            SvgPicture.asset('images/svgAssets/accessProcess1.svg'),
            Positioned(
                right: 0,
                bottom: 0,
                child: SvgPicture.asset('images/svgAssets/accessProcess1.svg'))
          ],
        ),
      ),
    );
  }

  Widget _animatedTelu(){
    return AnimatedSwitcher(
      duration: Duration(seconds: 10),
      child: Container(
        height: 230,
        width: 230,
        child: Stack(
          children: [
            SvgPicture.asset('images/svgAssets/acessProcess2.svg'),
            Positioned(
                right: 0,
                bottom: 0,
                child: SvgPicture.asset('images/svgAssets/acessProcess2.svg'))
          ],
        ),
      ),
    );
  }
}
