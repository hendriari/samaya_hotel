import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileAccount extends StatefulWidget {
  const ProfileAccount({Key? key}) : super(key: key);

  @override
  State<ProfileAccount> createState() => _ProfileAccountState();
}

class _ProfileAccountState extends State<ProfileAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
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
                          Text('Profile',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 22)),
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
              height: 400,
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
                                  borderSide: const BorderSide(
                                      color: Colors.deepPurple),
                                  borderRadius: BorderRadius.circular(20)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                      color: Colors.deepPurple))),
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
                          ],
                        ),
                        child: TextField(
                          keyboardType: TextInputType.datetime,
                          cursorColor: Colors.deepPurple,
                          decoration: InputDecoration(
                              hintText: '12/12/2099',
                              labelText: 'Date of Birth',
                              labelStyle:
                                  const TextStyle(color: Colors.deepPurple),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.deepPurple),
                                  borderRadius: BorderRadius.circular(20)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                      color: Colors.deepPurple))),
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
                          keyboardType: TextInputType.phone,
                          cursorColor: Colors.deepPurple,
                          decoration: InputDecoration(
                              hintText: '+621345678910',
                              labelText: 'Phone Number',
                              labelStyle:
                                  const TextStyle(color: Colors.deepPurple),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.deepPurple),
                                  borderRadius: BorderRadius.circular(20)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                      color: Colors.deepPurple))),
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
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: Colors.deepPurple,
                          decoration: InputDecoration(
                              hintText: 'lilyacordoba@gmail.com',
                              labelText: 'Email',
                              labelStyle:
                                  const TextStyle(color: Colors.deepPurple),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.deepPurple),
                                  borderRadius: BorderRadius.circular(20)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                      color: Colors.deepPurple))),
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
                          ],
                        ),
                        child: TextField(
                          keyboardType: TextInputType.streetAddress,
                          cursorColor: Colors.deepPurple,
                          decoration: InputDecoration(
                              hintText: 'Brooklyn, United States of America',
                              labelText: 'Address',
                              labelStyle:
                                  const TextStyle(color: Colors.deepPurple),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.deepPurple),
                                  borderRadius: BorderRadius.circular(20)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                      color: Colors.deepPurple))),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Save',
                  style: TextStyle(
                    fontSize: 22,
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
