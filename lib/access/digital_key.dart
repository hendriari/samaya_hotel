import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_cube/flutter_cube.dart';

class DigitalKey extends StatefulWidget {
  const DigitalKey({Key? key}) : super(key: key);

  @override
  _DigitalKey createState() => _DigitalKey();
}

class _DigitalKey extends State<DigitalKey> {
  late Object key;

  @override
  void initState() {
    key = Object(fileName: "images/cardkeys/cards.obj");
    key.updateTransform();
    key.position.setValues(0, 0, 5);
    super.initState();
  }

  late final width = MediaQuery.of(context).size.width;
  bool click = false;

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
                    child: SizedBox(
                      height: 120,
                      width: MediaQuery.of(context).size.width * 1,
                      child: SvgPicture.asset(
                        'images/rectangle1.svg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 50,
                    left: 35,
                    child: InkResponse(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        children: const [
                          Icon(
                            Icons.arrow_back_ios_new,
                            size: 15,
                            color: Colors.white,
                          ),
                          Text(
                            '3D Keys',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),

            // mentahan
            Stack(
              children: [
                AnimatedContainer(
                  duration: const Duration(seconds: 3),
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: double.infinity,
                  child: Cube(
                    onSceneCreated: (Scene scene) {
                      scene.world.add(key);
                      scene.camera.zoom = 11;
                    },
                  ),
                ),
              ],
            ),
            const Text('Just for Animation',style: TextStyle(fontSize: 16, color: Colors.grey),),
          ],
        ),
      ),
    );
  }
}
