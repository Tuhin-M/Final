import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'login.dart';


class StudentHomePage extends StatelessWidget {
  final User user;
  StudentHomePage({this.user});
  final _key = GlobalKey<FormState>();

  // ignore: non_constant_identifier_names
  Future SendData() async {
    // ignore: unused_local_variable
    final db = FirebaseFirestore.instance.collection("Userinfo").add({
      'name': "Tuhin",
      'roll': 35000117019.toString(),
      'number': 75000117019,
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
      body: Container(
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
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Can't be empty";
                      } else if (value.length <= 10) {
                        return "Should be greater than 10";
                      } else
                        return null;
                    },
            //        controller: myControllerName,
                  ),
                  new TextFormField(
                    decoration: new InputDecoration(
                      labelText: 'Roll *',
                      icon: Icon(Icons.person),
                      hintText: 'What is your 11 digit roll number?',
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Can't be empty";
                      }
                      //    else if (value.length == 11) {
                      //     return "Should be 11 digit";
                      //  }
                      else
                        return null;
                    }, // Only numbers can be entered
                //    controller: myControllerRoll,
                  ),
                  new TextFormField(
                    decoration: new InputDecoration(
                      labelText: 'Contact *',
                      icon: Icon(Icons.contact_phone),
                      hintText: 'What is your contact number?',
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Can't be empty";
                      }
                      // else if (value.length == 10) {
                      //  return "Should be a valid contact number";}
                      else
                        return null;
                    }, // Only numbers can be entered
                //    controller: myControllerNumber,
                  ),
                  FlatButton(
                    child: Text("Validate"),
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: () {
                      if (_key.currentState.validate()) {
                        SendData();
                      }
                    },
                  ),
                  QrImage(
                      data: "35000117019",
                      version: QrVersions.auto,
                      size: 250.0),
                  Text(user.email.toString()),
                  RaisedButton(
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
    );
  }
}