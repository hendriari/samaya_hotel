import 'package:flutter/material.dart';

class RegisterAccount extends StatefulWidget {
  const RegisterAccount({Key? key}) : super(key: key);

  @override
  State<RegisterAccount> createState() => _RegisterAccountState();
}

class _RegisterAccountState extends State<RegisterAccount> {
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
                          Text('Sign Up',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 22)),
                        ],
                      ),
                    )),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                'PERSONAL INFORMATION',
                style: TextStyle(fontSize: 24),
              ),
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
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                              )),
                        ),
                      ),
                      const Positioned(
                        left: 20,
                        child: Text(
                          'Full Name',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 80,
                  child: Stack(
                    children: [
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
                                obscureText: true,
                                keyboardType: TextInputType.datetime,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                              ),
                            )),
                      ),
                      const Positioned(
                        left: 20,
                        child: Text(
                          'Date of Birth',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 80,
                  child: Stack(
                    children: [
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
                                decoration:
                                    InputDecoration(border: InputBorder.none),
                              ),
                            )),
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
                SizedBox(
                  height: 80,
                  child: Stack(
                    children: [
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
                                decoration:
                                    InputDecoration(border: InputBorder.none),
                              ),
                            )),
                      ),
                      const Positioned(
                        left: 20,
                        child: Text(
                          'Password',
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
                              onTap: () {Navigator.pop(context);},
                              child: const Text('Login',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.deepPurple)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
                ],
              )),
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
                  'Sign Up',
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
