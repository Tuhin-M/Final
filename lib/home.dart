import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'login.dart';

class HomePage extends StatefulWidget {
  final User user;
  HomePage({this.user});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _key = GlobalKey<FormState>();

  final myName = TextEditingController();
  final rollNum = TextEditingController();
  final phoneNum = TextEditingController();
  final emailNum = TextEditingController();
  var _showQr = false;
  QrImage _qrImage;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myName.dispose();
    super.dispose();
  }

  // ignore: non_constant_identifier_names
  Future SendData(name, roll, phone, email) async {
    print("My name is " +
        name +
        ", Roll: " +
        roll +
        ", Mob: " +
        phone +
        ", Email: " +
        email);
    // ignore: unused_local_variable
    final db = FirebaseFirestore.instance.collection("Userinfo").add({
      'name': name,
      'roll': roll,
      'number': phone,
      'email': email,
    });
  }

  void _generateQrCode() {
    setState(() {
      _qrImage =
          QrImage(data: rollNum.text, version: QrVersions.auto, size: 200);
      _showQr = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Presence"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.photo), onPressed: () {})
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.all(32),
            child: Form(
              key: _key,
              child: Column(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        hintText: 'What do people call you?',
                        labelText: 'Name *',
                      ),
                      validator: NameValidator.validate,
                      controller: myName,
                    ),

                    TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        hintText: 'What is your 11 digit roll number ?',
                        labelText: 'Roll *',
                      ),
                      validator: RollValidator.validate,
                      controller: rollNum,
                    ),

                    TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.contact_phone),
                        hintText: 'What is your phone number?',
                        labelText: 'Contact *',
                      ),
                      validator: ContactValidator.validate,
                      controller: phoneNum,
                    ),

                    TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.email),
                        hintText: 'What is your email id?',
                        labelText: 'Email *',
                      ),
                      validator: EmailValidator.validate,
                      controller: emailNum,
                    ),

                    // FlatButton(
                    //   child: Text("Validate"),
                    //   color: Colors.blue,
                    //   textColor: Colors.white,
                    //   onPressed: () {
                    //     print("hello " + myName.text);
                    //     SendData(myName.text, rollNum.text, phoneNum.text,
                    //         emailNum.text);
                    //   },
                    // ),
                    TextButton(
                      child: Text("Validate"),
                      // color: Colors.blue,
                      // textColor: Colors.white,

                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.blue,
                      ),

                      onPressed: () {
                        if (_key.currentState.validate()) {
                          print("hello " + myName.text);
                          SendData(myName.text, rollNum.text, phoneNum.text,
                              emailNum.text);
                        } else {
                          // Invalid!
                          print('invalid');
                          return;
                        }
                      },
                    ),

                    _showQr
                        ? _qrImage
                        : TextButton(
                            onPressed: _generateQrCode,
                            child: Text('Generate Qr code')),

                    Text(widget.user.email.toString()),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      child: Text("Sign Out"),
                    )
                  ]),
            )),
      ),
    );
  }
}

class NameValidator {
  static String validate(String value) {
    if (value.isEmpty) {
      return "Name cant't be empty";
    }
    return null;
  }
}

class RollValidator {
  static String validate(String value) {
    if (value.isEmpty) {
      return "Roll cant't be empty";
    }
    return null;
  }
}

class ContactValidator {
  static String validate(String value) {
    if (value.isEmpty) {
      return "Contact number cant't be empty";
    }
    return null;
  }
}

class EmailValidator {
  static String validate(String value) {
    if (value.isEmpty) {
      return "Email cant't be empty";
    }
    return null;
  }
}

class PasswordValidator {
  static String validate(String value) {
    if (value.isEmpty) {
      return "Password cant't be empty";
    }
    return null;
  }
}