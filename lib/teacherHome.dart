import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'login.dart';

class TeacherHomePage extends StatelessWidget {
  final User user;
  TeacherHomePage({this.user});
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
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.subject),
                      hintText: 'What is the topic?',
                      labelText: 'Subject *',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Can't be empty";
                      } else if (value.length <= 5) {
                        return "Should be greater than 5";
                      } else
                        return null;
                    },
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
