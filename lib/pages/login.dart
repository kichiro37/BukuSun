import 'package:bossunapp/pages/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bossunapp/pages/register.dart';
import 'package:bossunapp/models/data_account.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isRememberMe = false;
  bool isLogin = false;
  String username = '';
  String password = '';
  String name = '';
  String imgUrl = '';

  void userInfo(username) {
    print(username);
    for (var i = 1; i <= dataAccount.length; i++) {
      if (username == dataAccount[i - 1].username) {
        name = dataAccount[i - 1].name;
        imgUrl = dataAccount[i - 1].imgUrl;
      }
    }
  }

  void doLogin(username, password) {
    dataAccount.forEach((akun) {
      if (akun.username == username && akun.password == password) {
        isLogin = true;
      }
    });
    if (!isLogin) print('username / password salah');
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
                  padding: EdgeInsets.only(right: 25, left: 25, top: 500),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'OR',
                        style: TextStyle(
                            color: Colors.amber,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      buildSignUpBtn()
                    ],
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50.0),
                    bottomRight: Radius.circular(50.0)),
                child: Container(
                  height: 450,
                  width: double.infinity,
                  color: Colors.amber,
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'BukuSun',
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 40),
                        buildUsername(),
                        SizedBox(height: 10),
                        buildPassword(),
                        buildForgotBtn(),
                        buildRemember(),
                        buildLoginBtn(),
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
              color: Colors.black54,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 50,
          child: TextField(
            onChanged: (value) {
              setState(() {
                username = value;
              });
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
                hintText: 'Username',
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
              color: Colors.black54,
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

  Widget buildForgotBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
          onPressed: () {
            print('Forgot Password pressed');
          },
          child: Text(
            'Forgot Password?',
            style:
                TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
          )),
    );
  }

  Widget buildRemember() {
    return Container(
      height: 20,
      child: Row(
        children: [
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.black87),
            child: Checkbox(
              value: isRememberMe,
              checkColor: Colors.amber,
              activeColor: Colors.black87,
              onChanged: (value) {
                setState(() {
                  isRememberMe = value!;
                });
              },
            ),
          ),
          Text('Remember me',
              style:
                  TextStyle(color: Colors.black87, fontWeight: FontWeight.bold))
        ],
      ),
    );
  }

  Widget buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.black87,
          padding: EdgeInsets.all(15),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
        onPressed: () {
          doLogin(username, password);
          userInfo(username);
          if (isLogin == true) {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return MainScreen(username: username, name: name, imgUrl: imgUrl);
            }));
          } else
            print('LOGIN GAGAL');
        },
        child: Text(
          'LOGIN',
          style: TextStyle(
              color: Colors.amber, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget buildSignUpBtn() {
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
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return Register();
          }));
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
