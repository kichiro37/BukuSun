import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bossunapp/models/data_account.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

Widget buildLoginBtn(context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Already have an account?',
        style: TextStyle(
            color: Colors.black87, fontSize: 13, fontWeight: FontWeight.bold),
      ),
      Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.black87,
            padding: EdgeInsets.all(15),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'LOGIN',
            style: TextStyle(
                color: Colors.amber, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      )
    ],
  );
}

class _RegisterState extends State<Register> {
  final _text = TextEditingController();
  bool _validate = false;
  String? username;
  String? name;
  String? password;
  String repassword = '';
  String? imgUrl;

  void doRegister(username, name, password, repassword, imgUrl) {
    if (username != null &&
        name != null &&
        password != null &&
        imgUrl != null) {
      if (password.length >= 8) {
        if (password == repassword) {
          var isFound = false;
          dataAccount.forEach((akun) {
            // print('=====user=====');
            // print(username);
            // print('=====name=====');
            // print(akun.username);
            // print('=====OO=====');
            if (akun.username == username) {
              isFound = true;
              print('gagal regiter karena user sama');
            }
          });
          if (!isFound) {
            print('register');
            addAccount(username, name, password, imgUrl);
          }
        } else
          print('repassword tidak sama');
      } else
        print('panjang password kurang dari 8');
    } else
      print('gagal register');
  }

  void addAccount(username, name, password, imgUrl) {
    dataAccount.add(
      Account(
          username: username, name: name, password: password, imgUrl: imgUrl),
    );
    dataAccount.forEach((akun) {
      print('=================');
      print(akun.username);
      print(akun.name);
      print(akun.password);
      print(akun.imgUrl);
      print('=================');
    });
  }

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.black87,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.only(right: 25, left: 25, top: 160),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Register',
                        style: TextStyle(
                            color: Colors.amber,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      buildUsername(),
                      SizedBox(height: 10),
                      buildName(),
                      SizedBox(height: 10),
                      buildPassword(),
                      SizedBox(height: 10),
                      buildRePassword(),
                      SizedBox(height: 10),
                      buildImgURL(),
                      buildRegisterBtn(),
                    ],
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50.0),
                    bottomRight: Radius.circular(50.0)),
                child: Container(
                  height: 150,
                  width: double.infinity,
                  color: Colors.amber,
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildLoginBtn(context),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildUsername() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Color(0xff4b4f53),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 50,
          child: TextField(
            controller: _text,
            onChanged: (value) {
              username = value;
            },
            keyboardType: TextInputType.name,
            style: TextStyle(color: Colors.amber),
            decoration: InputDecoration(
                errorText: _validate ? 'Username can\'t be empty' : null,
                errorStyle: TextStyle(color: Colors.amber),
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14, left: 14),
                prefixIcon: Icon(
                  Icons.person,
                  color: Color(0xffffd700),
                ),
                hintText: 'Username',
                hintStyle: TextStyle(color: Colors.amber)),
          ),
        )
      ],
    );
  }

  Widget buildName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Color(0xff4b4f53),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 50,
          child: TextField(
            onChanged: (value) {
              name = value;
            },
            keyboardType: TextInputType.name,
            style: TextStyle(color: Colors.amber),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.person,
                  color: Color(0xffffd700),
                ),
                hintText: 'Full Name',
                hintStyle: TextStyle(color: Colors.amber)),
          ),
        )
      ],
    );
  }

  Widget buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Color(0xff4b4f53),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 50,
          child: TextField(
            onChanged: (value) {
              password = value;
            },
            obscureText: true,
            style: TextStyle(color: Colors.amber),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Color(0xffffd700),
                ),
                hintText: 'Password',
                hintStyle: TextStyle(color: Colors.amber)),
          ),
        )
      ],
    );
  }

  Widget buildRePassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Color(0xff4b4f53),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 50,
          child: TextField(
            onChanged: (value) {
              repassword = value;
            },
            obscureText: true,
            style: TextStyle(color: Colors.amber),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Color(0xffffd700),
                ),
                hintText: 'Confirm Password',
                hintStyle: TextStyle(color: Colors.amber)),
          ),
        )
      ],
    );
  }

  Widget buildImgURL() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Color(0xff4b4f53),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 50,
          child: TextField(
            onChanged: (value) {
              imgUrl = value;
            },
            keyboardType: TextInputType.text,
            style: TextStyle(color: Colors.amber),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.image,
                  color: Color(0xffffd700),
                ),
                hintText: 'Image URL',
                hintStyle: TextStyle(color: Colors.amber)),
          ),
        )
      ],
    );
  }

  Widget buildRegisterBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.amber,
          padding: EdgeInsets.all(15),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
        onPressed: () {
          setState(() {
            _text.text.isEmpty ? _validate = true : _validate = false;
            doRegister(username, name, password, repassword, imgUrl);
          });
        },
        child: Text(
          'SIGN UP',
          style: TextStyle(
              color: Colors.black87, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
