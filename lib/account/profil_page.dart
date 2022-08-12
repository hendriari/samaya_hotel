import 'package:flutter/material.dart';

class ProfileAccount extends StatefulWidget {
  const ProfileAccount({Key? key}) : super(key: key);

  @override
  State<ProfileAccount> createState() => _ProfileAccountState();
}

class _ProfileAccountState extends State<ProfileAccount> {
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
                  )),
            ],
          ),
        ),
        SizedBox(
          height: 400,
          width: double.infinity,
          child: Column(
            children: <Widget>[
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
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Jhon Doe'),
                            ),
                          )),
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
                              keyboardType: TextInputType.datetime,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '12/12/2099'),
                            ),
                          )),
                    ),
                    const Positioned(
                      left: 20,
                      child: Text(
                        'Date of Birthday',
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
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '+628989898989'),
                            ),
                          )),
                    ),
                    const Positioned(
                      left: 20,
                      child: Text(
                        'Phone Number',
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
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'tutordisayangayang@gmail.com'),
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
                              keyboardType: TextInputType.streetAddress,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText:
                                      'Gang cuek, Jl. ingpo hiling, no 99 '),
                            ),
                          )),
                    ),
                    const Positioned(
                      left: 20,
                      child: Text(
                        'Address',
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
        Expanded(
          child: SizedBox(
            height: 50,
            width: double.infinity,
            child: Center(
                child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              onPressed: () {},
              child: const Text(
                'Save',
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
            )),
          ),
        ),
      ],
    ));
  }
}
