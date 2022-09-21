import 'package:flutter/material.dart';
import 'package:samaya_hotel/dialog/singup_success.dart';

class RegisterAccount extends StatefulWidget {
  const RegisterAccount({Key? key}) : super(key: key);

  @override
  State<RegisterAccount> createState() => _RegisterAccountState();
}

class _RegisterAccountState extends State<RegisterAccount> {
  late double sizeHeight = MediaQuery.of(context).size.height;
  late double sizeWidth = MediaQuery.of(context).size.width;

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
      width: sizeWidth * 1,
      child: Stack(
        children: <Widget>[
          Positioned(
            child: Container(
              height: 100,
              width: sizeWidth,
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
                    'Sign Up',
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
    );
  }

  Widget _middle() {
    return SizedBox(
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
                decoration: InputDecoration(
                    labelText: 'Full Name',
                    labelStyle: const TextStyle(color: Colors.deepPurple),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(20)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            const BorderSide(color: Colors.deepPurple))),
              ),
            ),
          ),
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
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                    labelText: 'Date of Birth',
                    labelStyle: const TextStyle(color: Colors.deepPurple),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(20)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            const BorderSide(color: Colors.deepPurple))),
              ),
            ),
          ),
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
                    labelStyle: const TextStyle(color: Colors.deepPurple),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(20)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            const BorderSide(color: Colors.deepPurple))),
              ),
            ),
          ),
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
                obscureText: true,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.remove_red_eye,
                        color: Colors.deepPurple,
                      ),
                    ),
                    labelText: 'Password',
                    labelStyle: const TextStyle(color: Colors.deepPurple),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(20)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            const BorderSide(color: Colors.deepPurple))),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottom() {
    return Column(
      children: [
        const SizedBox(
          height: 100,
        ),
        Column(
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
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromRGBO(107, 83, 204, 1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animasi1, animasi2) =>
                            const SignUpSuccess(),
                        reverseTransitionDuration: Duration.zero,
                        transitionDuration: Duration.zero,
                      ));
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
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
