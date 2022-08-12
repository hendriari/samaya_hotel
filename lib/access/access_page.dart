import 'package:flutter/material.dart';



class AccessPage extends StatefulWidget {
  const AccessPage({Key? key}) : super(key: key);

  @override
  _AccessPage createState() => _AccessPage();
}

class _AccessPage extends State<AccessPage> {
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
                    child: Image.asset(
                      'images/Rectangle4.png',
                      fit: BoxFit.cover,
                      width: double.infinity,
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
                  const Positioned(
                    bottom: 66,
                    left: 50,
                    child: Text(
                      'Date',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ),
                  //textField
                  // Positioned(
                  //   bottom: 100,
                  //   child: TextField(
                  //     onTap: (){},
                  //
                  //   ),
                  // ),
                ],
              ),
            ),
            Container(
              height: 620,
              width: double.infinity,
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
