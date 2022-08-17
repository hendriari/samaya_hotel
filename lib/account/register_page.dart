import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:samaya_hotel/dialog/singup_success.dart';

class RegisterAccount extends StatefulWidget {
  const RegisterAccount({Key? key}) : super(key: key);

  @override
  State<RegisterAccount> createState() => _RegisterAccountState();
}

class _RegisterAccountState extends State<RegisterAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _header(),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  'PERSONAL INFORMATION',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
            _middle(),
            _bottom(),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return SizedBox(
      height: 120,
      width: MediaQuery.of(context).size.width * 1,
      child: Stack(
        children: <Widget>[
          Positioned(
            child: SvgPicture.asset(
              'images/rectangle1.svg',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width * 1,
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
                    Text('Sign Up',
                        style: TextStyle(color: Colors.white, fontSize: 22)),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget _middle() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 80,
            child: Padding(
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
                child: TextField(
                  cursorColor: Colors.deepPurple,
                  decoration: InputDecoration(
                      labelText: 'Full Name',
                      labelStyle: const TextStyle(color: Colors.deepPurple),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.deepPurple),
                          borderRadius: BorderRadius.circular(20)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(color: Colors.deepPurple))),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 80,
            child: Padding(
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
                  child: TextField(
                    cursorColor: Colors.deepPurple,
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                        labelText: 'Date of Birth',
                        labelStyle: const TextStyle(color: Colors.deepPurple),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(20)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                const BorderSide(color: Colors.deepPurple))),
                  )),
            ),
          ),
          SizedBox(
            height: 80,
            child: Padding(
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
                  child: TextField(
                    cursorColor: Colors.deepPurple,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: const TextStyle(color: Colors.deepPurple),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(20)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                const BorderSide(color: Colors.deepPurple))),
                  )),
            ),
          ),
          SizedBox(
            height: 80,
            child: Padding(
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
                  child: TextField(
                    cursorColor: Colors.deepPurple,
                    obscureText: true,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.remove_red_eye, color: Colors.deepPurple,),
                        ),
                        labelText: 'Password',
                        labelStyle: const TextStyle(color: Colors.deepPurple),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(20)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                const BorderSide(color: Colors.deepPurple))),
                  )),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottom() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      child: Stack(
        children: <Widget>[
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Already have an account ?',
                            style: TextStyle(fontSize: 18)),
                        const SizedBox(
                          width: 10,
                        ),
                        InkResponse(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Login',
                              style: TextStyle(
                                  fontSize: 18, color: Colors.deepPurple)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Center(
                        child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.deepPurple,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animasi1, animasi2) =>
                                  const SignUpSuccess(),
                              reverseTransitionDuration: Duration.zero,
                              transitionDuration: Duration.zero,
                            ));
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                    )),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
