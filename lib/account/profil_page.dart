import 'package:flutter/material.dart';

class ProfileAccount extends StatefulWidget {
  const ProfileAccount({Key? key}) : super(key: key);

  @override
  State<ProfileAccount> createState() => _ProfileAccountState();
}

class _ProfileAccountState extends State<ProfileAccount> {
  late double sizeHeight = MediaQuery.of(context).size.height;
  late double sizeWidth = MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
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
                            'Profile',
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
              height: 430,
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
                            hintText: 'Lilya Cordoba',
                            labelText: 'Full Name',
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
                        keyboardType: TextInputType.datetime,
                        cursorColor: Colors.deepPurple,
                        decoration: InputDecoration(
                          hintText: '12/12/2099',
                          labelText: 'Date of Birth',
                          labelStyle: const TextStyle(color: Colors.deepPurple),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.deepPurple),
                              borderRadius: BorderRadius.circular(20)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                const BorderSide(color: Colors.deepPurple),
                          ),
                        ),
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
                          ]),
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        cursorColor: Colors.deepPurple,
                        decoration: InputDecoration(
                            hintText: '+621345678910',
                            labelText: 'Phone Number',
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
                          ]),
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: Colors.deepPurple,
                        decoration: InputDecoration(
                          hintText: 'lilyacordoba@gmail.com',
                          labelText: 'Email',
                          labelStyle: const TextStyle(color: Colors.deepPurple),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.deepPurple),
                              borderRadius: BorderRadius.circular(20)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                const BorderSide(color: Colors.deepPurple),
                          ),
                        ),
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
                        keyboardType: TextInputType.streetAddress,
                        cursorColor: Colors.deepPurple,
                        decoration: InputDecoration(
                          hintText: 'Brooklyn, United States of America',
                          labelText: 'Address',
                          labelStyle: const TextStyle(color: Colors.deepPurple),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.deepPurple),
                              borderRadius: BorderRadius.circular(20)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              color: Colors.deepPurple,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: sizeWidth * 0.1,
            ),
            Center(
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
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
                      'Save',
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
      ),
    );
  }
}
