import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'login.dart';

class HomePage extends StatelessWidget {
  final User user;
  HomePage({this.user});
  final _key = GlobalKey<FormState>();

  Future SendData() async {
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
        title: Text("Presence bhu"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.photo),
              onPressed: () {
                if (_key.currentState.validate()) {
                  SendData();
                }
              })
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
                      labelText: 'Name **',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Can't be empty";
                      } else if (value.length <= 10) {
                        return "Should be greater than 10";
                      } else
                        return null;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: 'What is your 11 digit roll number ?',
                      labelText: 'Roll *',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Can't be empty";
                      } else if (value.length <= 11) {
                        return "Should be greater than 10";
                      } else
                        return null;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.contact_phone),
                      hintText: 'What is your phone number?',
                      labelText: 'Contact *',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Can't be empty";
                      } else if (value.length <= 10) {
                        return "Should be genuin phone number";
                      } else
                        return null;
                    },
                  ),
                  FlatButton(
                    child: Text("Validate"),
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: () {},
                  ),
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
