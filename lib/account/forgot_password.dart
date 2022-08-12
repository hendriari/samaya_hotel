import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 150,
            width: double.infinity,
            child: Stack(
              children: <Widget>[
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  child: Image.asset(
                    'images/Rectangle4.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    top: 56,
                    left: 15,
                    child: InkResponse(
                      onTap: () {Navigator.pop(context);},
                      child: Row(
                        children: const [
                          Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.white,
                            size: 15,
                          ),
                          Text('Forgot Password',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 22)),
                        ],
                      ),
                    )),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 80,
                  child: Stack(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(11.0),
                        child: Container(
                          height: 60,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: const [
                                BoxShadow(
                                  offset: Offset(1, 4),
                                  blurRadius: 5,
                                  color: Colors.black54,
                                ),
                              ]),
                          child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: TextField(
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                              )),
                        ),
                      ),
                      const Positioned(
                        left: 20,
                        child: Text(
                          'Email',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
          Expanded(flex: 3, child: Container()),
          Expanded(
              flex: 2,
              child: Container()),
          Expanded(
            flex: 1,
            child: SizedBox(
              width: double.infinity,
              child: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.deepPurple,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    onPressed: () {},
                    child: const Text(
                      'Send',
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
