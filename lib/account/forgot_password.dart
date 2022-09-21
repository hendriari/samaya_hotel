import 'package:flutter/material.dart';
import 'package:samaya_hotel/dialog/email_sent.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  late double sizeHeight = MediaQuery.of(context).size.height;
  late double sizeWidht = MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 120,
              width: sizeWidht * 1,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    child: Container(
                      height: 100,
                      width: sizeWidht * 1,
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
                    top: 56,
                    left: 15,
                    child: InkResponse(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        children: const [
                          Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.white,
                            size: 15,
                          ),
                          Text(
                            'Forgot Password',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
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
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(11.0),
                    child: Container(
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
                        ],
                      ),
                      child: TextField(
                        cursorColor: Colors.deepPurple,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle:
                                const TextStyle(color: Colors.deepPurple),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.deepPurple),
                                borderRadius: BorderRadius.circular(20)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                    color: Colors.deepPurple))),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: sizeHeight * 0.55,
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) =>
                        const EmailSent(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                  ),
                );
              },
              child: Container(
                width: 141,
                height: 37,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(107, 83, 204, 1),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                          offset: Offset(2, 3),
                          color: Colors.black38,
                          blurRadius: 2)
                    ]),
                child: const Center(
                  child: Text(
                    'Send',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
