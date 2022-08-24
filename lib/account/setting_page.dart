import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingAccount extends StatefulWidget {
  const SettingAccount({Key? key}) : super(key: key);

  @override
  State<SettingAccount> createState() => _SettingAccountState();
}

class _SettingAccountState extends State<SettingAccount> {
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
                          Text('Setting',
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
                          obscureText: true,
                          cursorColor: Colors.deepPurple,
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.remove_red_eye,
                                  color: Colors.deepPurple,
                                ),
                              ),
                              labelText: 'New Password',
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
                          obscureText: true,
                          cursorColor: Colors.deepPurple,
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.remove_red_eye,
                                  color: Colors.deepPurple,
                                ),
                              ),
                              labelText: 'Confirm Password',
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
