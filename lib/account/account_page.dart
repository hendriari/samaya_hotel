import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:samaya_hotel/account/profil_page.dart';
import 'package:samaya_hotel/account/register_page.dart';
import 'package:samaya_hotel/account/setting_page.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';
import 'forgot_password.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPage createState() => _AccountPage();
}

class _AccountPage extends State<AccountPage> {
  Future getImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedImage =
        await picker.pickImage(source: ImageSource.camera);
    image = File(pickedImage!.path);
    setState(() {});
  }

  File? image;
  bool? checkbox;
  late bool _isLogin;

  //pengecekan kondisi untuk login
  @override
  void initState() {
    super.initState();
    checkbox = false;
    _isLogin = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //contoh implemen tornary condition
      body: _isLogin ? _buildLogin() : _buildLogout(),
    );
  }

  //kodingan Account Page
  Widget _buildLogin() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 400,
            child: Stack(
              children: <Widget>[
                SizedBox(
                    height: 250,
                    child: SvgPicture.asset(
                      'images/rectangle2.svg',
                      fit: BoxFit.cover,
                      width: double.infinity,
                    )),
                Positioned(
                  bottom: 65,
                  right: 0,
                  left: 0,
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        color: Colors.white,
                        height: 190,
                        width: 190,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 70,
                  right: 0,
                  left: 0,
                  child: Center(
                    child: SizedBox(
                      height: 180,
                      width: 180,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: image != null
                            ? Image.file(
                                image!,
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                'https://img.freepik.com/free-photo/young-beautiful-woman-pink-warm-sweater-natural-look-smiling-portrait-isolated-long-hair_285396-896.jpg',
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 280,
                  right: 0,
                  left: 150,
                  child: SizedBox(
                    height: 70,
                    width: 70,
                    child: InkWell(
                        onTap: () async {
                          await getImage();
                        },
                        child: SvgPicture.asset('images/iconcamera.svg')),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    height: 50,
                    child: Column(
                      children: const [
                        Center(
                          child: Text(
                            'Lilya Cordoba',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            'lilyacordoba@gmail.com',
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 280,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProfileAccount()));
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(1, 4),
                            color: Colors.black54,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Stack(
                        children: const [
                          Positioned(
                            bottom: 13,
                            left: 15,
                            child: Text(
                              'Profile',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                          ),
                          context: context,
                          builder: (context) => membershipSheet());
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(1, 4),
                            color: Colors.black54,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Stack(
                        children: const [
                          Positioned(
                            bottom: 13,
                            left: 15,
                            child: Text(
                              'Membership',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SettingAccount()));
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(1, 4),
                            color: Colors.black54,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Stack(
                        children: const [
                          Positioned(
                            bottom: 13,
                            left: 15,
                            child: Text(
                              'Setting',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20))),
                          context: context,
                          builder: (context) => faqSheet());
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(1, 4),
                            color: Colors.black54,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Stack(
                        children: const [
                          Positioned(
                            bottom: 13,
                            left: 15,
                            child: Text(
                              'Faq',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          SizedBox(
            height: 180,
            child: Column(
              children: <Widget>[
                const Center(
                  child: Text(
                    'Samaya Hotel',
                    style: TextStyle(color: Colors.deepPurple, fontSize: 22),
                  ),
                ),
                SizedBox(
                  height: 20,
                  child: Stack(
                    children: const <Widget>[
                      Positioned(
                        right: 150,
                        child: Text(
                          'v 1.0.1',
                          style: TextStyle(color: Colors.deepPurple),
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.deepPurple,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    onPressed: () {
                      setState(
                        () {
                          _isLogin = false;
                        },
                      );
                    },
                    child: const Text(
                      'Log Out',
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //kodingan Login Page
  Widget _buildLogout() {
    return SingleChildScrollView(
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
                  top: 35,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    height: 70,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Column(
                        children: const [
                          Text('Samaya Hotel',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 36)),
                          Padding(
                            padding: EdgeInsets.only(left: 155),
                            child: Text('v 1.0.1',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                'Wellcome',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
          SizedBox(
            height: 170,
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
                          labelText: 'Password',
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
            height: 30,
            child: Row(
              children: <Widget>[
                Checkbox(
                  activeColor: Colors.deepPurple,
                  value: checkbox,
                  onChanged: (value) {
                    setState(
                      () {
                        checkbox = value!;
                      },
                    );
                  },
                ),
                const Text('Remember Me')
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
          ),
          Column(
            children: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ForgotPassword()));
                },
                child: const Text(
                  'Forgot Password ?',
                  style: TextStyle(color: Colors.deepPurple, fontSize: 15),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don\'t have an account ?',
                        style: TextStyle(fontSize: 18)),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterAccount()));
                      },
                      child: const Text('Sign Up',
                          style: TextStyle(
                              fontSize: 18, color: Colors.deepPurple)),
                    ),
                  ],
                ),
              ),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.deepPurple,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  onPressed: () {
                    setState(
                      () {
                        _isLogin = true;
                      },
                    );
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//comingsoon button sheet
Widget membershipSheet() => const Center(
      child: Text('Comingsoon'),
    );

//faq button sheet
Widget faqSheet() => ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: const <Widget>[
              Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'sstandard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. '),
              SizedBox(height: 10),
              Text(
                  'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).'),
              SizedBox(height: 10),
              Text(
                  'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.'),
              SizedBox(height: 10),
              Text(
                  'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.')
            ],
          ),
        ),
      ],
    );
