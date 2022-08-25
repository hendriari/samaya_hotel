import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:samaya_hotel/bottomnavbar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPage createState() => _LandingPage();
}

int activeIndex = 0;
final assetImages = [
  'images/hotels/landingimages4.jpg',
  'images/hotels/hotelloby.jpg',
  'images/hotels/landingimages3.jpg',
  'images/hotels/landingimages1.jpg',
  'images/hotels/landingimages2.jpg',
];

class _LandingPage extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    final mediaQueryWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: Stack(
                children: [
                  CarouselSlider.builder(
                    itemCount: assetImages.length,
                    itemBuilder: (context, index, realIndex) {
                      final assetImage = assetImages[index];
                      return buildImage(assetImage, index);
                    },
                    options: CarouselOptions(
                        height: 650,
                        viewportFraction: 1,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        onPageChanged: (index, reason) =>
                            setState(() => activeIndex = index)),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 0,
                    right: 0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Enjoy Your Quality Time',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                        const Text(
                          'With Our Services',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        buildIndicator(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 62,
              width: double.infinity,
              child: Column(
                children: const <Widget>[
                  Center(
                    child: Text(
                      'Samaya Hotel',
                      style: TextStyle(
                        fontSize: 36,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(160, 0, 0, 0),
                    child: Text(
                      'v 1.0.1',
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 100,
              width: mediaQueryWidth,
              child: Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                      side:
                          const BorderSide(width: 1, color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondAnimation) =>
                            const BottomNavigationBars(),
                        transitionDuration: const Duration(milliseconds: 1500),
                        transitionsBuilder:
                            (context, animation, secondAnimation, child) {
                          const begin = Offset(0.0, 1.0);
                          const end = Offset.zero;
                          const curve = Curves.elasticIn;

                          var tween = Tween(begin: begin, end: end)
                              .chain(CurveTween(curve: curve));

                          return SlideTransition(
                            position: animation.drive(tween),
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                  child: const Text(
                    'Book Now',
                    style: TextStyle(color: Colors.deepPurple, fontSize: 24),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildImage(String assetImage, int index) => Image.asset(
        assetImage,
        fit: BoxFit.cover,
        width: double.infinity,
      );

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: assetImages.length,
        effect: const ExpandingDotsEffect(
          dotWidth: 10,
          dotHeight: 10,
          dotColor: Colors.grey,
          activeDotColor: Colors.deepPurple,
        ),
      );
}
