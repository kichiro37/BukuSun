import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bossunapp/models/data_account.dart';
import 'package:uuid/uuid.dart';

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
  final _textUsername = TextEditingController();
  final _textName = TextEditingController();
  final _textPassword = TextEditingController();
  final _textRepassword = TextEditingController();
  final _textImgUrl = TextEditingController();
  bool _validateUsername = false;
  bool _validateName = false;
  bool _validatePassword = false;
  bool _validateRepassword = false;
  bool _validateImgUrl = false;

  String? username;
  String? name;
  String? password;
  String? repassword;
  String? imgUrl;
  var uuid = Uuid();

  void doRegister(id, username, name, password, repassword, imgUrl) {
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
              showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                        backgroundColor: Colors.black,
                        title: Text('Gagal Register',
                            style: TextStyle(
                                color: Colors.amber,
                                fontWeight: FontWeight.bold)),
                        content: Text('Username sudah ada',
                            style: TextStyle(color: Colors.amber)),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context, 'OK');
                              },
                              child: Text('OK',
                                  style: TextStyle(
                                      color: Colors.amber,
                                      fontWeight: FontWeight.bold)))
                        ],
                      ));
            }
          });
          if (!isFound) {
            showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                      backgroundColor: Colors.black,
                      title: Text('Berhasil Register',
                          style: TextStyle(
                              color: Colors.amber,
                              fontWeight: FontWeight.bold)),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context, 'OK');
                            },
                            child: Text('OK',
                                style: TextStyle(
                                    color: Colors.amber,
                                    fontWeight: FontWeight.bold)))
                      ],
                    ));
            addAccount(id, username, name, password, imgUrl);
          }
        } else
          showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                    backgroundColor: Colors.black,
                    title: Text('Gagal Register',
                        style: TextStyle(
                            color: Colors.amber, fontWeight: FontWeight.bold)),
                    content: Text('Repassword tidak sama',
                        style: TextStyle(color: Colors.amber)),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context, 'OK');
                          },
                          child: Text('OK',
                              style: TextStyle(
                                  color: Colors.amber,
                                  fontWeight: FontWeight.bold)))
                    ],
                  ));
      } else
        showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
                  title: Text('Gagal Register',
                      style: TextStyle(
                          color: Colors.amber, fontWeight: FontWeight.bold)),
                  content: Text('panjang password kurang dari 8',
                      style: TextStyle(
                          color: Colors.amber, fontWeight: FontWeight.bold)),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context, 'OK');
                        },
                        child: Text('OK',
                            style: TextStyle(
                                color: Colors.amber,
                                fontWeight: FontWeight.bold)))
                  ],
                ));
    } else
      print('gagal register');
  }

  void addAccount(id, username, name, password, imgUrl) {
    dataAccount.add(
      Account(
          id: id,
          username: username,
          name: name,
          password: password,
          imgUrl: imgUrl),
    );
    dataAccount.forEach((akun) {
      print('=================');
      print(akun.id);
      print(akun.username);
      print(akun.name);
      print(akun.password);
      print(akun.imgUrl);
      print('=================');
    });
  }

  @override
  void dispose() {
    _textUsername.dispose();
    _textName.dispose();
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
            controller: _textUsername,
            onChanged: (value) {
              username = value;
            },
            keyboardType: TextInputType.name,
            style: TextStyle(color: Colors.amber),
            decoration: InputDecoration(
                errorText:
                    _validateUsername ? 'Username can\'t be empty' : null,
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
            controller: _textName,
            onChanged: (value) {
              name = value;
            },
            keyboardType: TextInputType.name,
            style: TextStyle(color: Colors.amber),
            decoration: InputDecoration(
                errorText: _validateName ? 'Name can\'t be empty' : null,
                errorStyle: TextStyle(color: Colors.amber),
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14, left: 14),
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
            controller: _textPassword,
            onChanged: (value) {
              password = value;
            },
            obscureText: true,
            style: TextStyle(color: Colors.amber),
            decoration: InputDecoration(
                errorText: _validatePassword
                    ? 'Password must be at least 8 characters'
                    : null,
                errorStyle: TextStyle(color: Colors.amber),
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14, left: 14),
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
            controller: _textRepassword,
            onChanged: (value) {
              repassword = value;
            },
            obscureText: true,
            style: TextStyle(color: Colors.amber),
            decoration: InputDecoration(
                errorText: _validateRepassword ? 'Password not same' : null,
                errorStyle: TextStyle(color: Colors.amber),
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14, left: 14),
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
            controller: _textImgUrl,
            onChanged: (value) {
              imgUrl = value;
            },
            keyboardType: TextInputType.text,
            style: TextStyle(color: Colors.amber),
            decoration: InputDecoration(
                errorText: _validateImgUrl ? 'ImageURL can\'t be empty' : null,
                errorStyle: TextStyle(color: Colors.amber),
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14, left: 14),
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
            String id = uuid.v4();
            _textUsername.text.isEmpty
                ? _validateUsername = true
                : _validateUsername = false;
            _textName.text.isEmpty
                ? _validateName = true
                : _validateName = false;
            _textPassword.text.isEmpty
                ? _validatePassword = true
                : _validatePassword = false;
            _textRepassword.text != _textPassword.text
                ? _validateRepassword = true
                : _validateRepassword = false;
            _textImgUrl.text.isEmpty
                ? _validateImgUrl = true
                : _validateImgUrl = false;
            doRegister(id, username, name, password, repassword, imgUrl);
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
