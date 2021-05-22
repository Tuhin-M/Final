import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:presence/teacherHome.dart';
import 'package:presence/home.dart';
import 'package:presence/signup.dart';
import 'home.dart';

import 'login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
        routes: {
          "/login":(context)=>LoginPage(),
          "/signup":(context)=>SignUpPage(),
          "/Home":(context)=>HomePage(),
          "/teacherHome":(context)=>TeacherHomePage(),
        },
        );
  }
}
