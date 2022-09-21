import 'package:flutter/material.dart';

class SettingAccount extends StatefulWidget {
  const SettingAccount({Key? key}) : super(key: key);

  @override
  State<SettingAccount> createState() => _SettingAccountState();
}

class _SettingAccountState extends State<SettingAccount> {
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
                            'Setting',
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
              height: 200,
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
              height: sizeHeight * 0.3,
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
