
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'scan.dart';

class TeacherHomePage extends StatefulWidget {
  
  final User user;
  TeacherHomePage({this.user});
  //final _key = GlobalKey<FormState>();
  @override
  _TeacherHomePageState createState() => _TeacherHomePageState();
}

class _TeacherHomePageState extends State<TeacherHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Homepage"),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image(image: NetworkImage("https://media.istockphoto.com/vectors/qr-code-scan-phone-icon-in-comic-style-scanner-in-smartphone-vector-vector-id1166145556")),
            flatButton("Scan QR CODE", ScanPage()),
            SizedBox(height: 20.0,),
            // flatButton("Generate QR CODE", GeneratePage()),
          ],
        ),
      ),
    );
  }

  Widget flatButton(String text, Widget widget) {
    return FlatButton(
      padding: EdgeInsets.all(15.0),
      onPressed: () async {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => widget));
      },
      child: Text(
        text,
        style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),
      ),
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.blue,width: 3.0),
          borderRadius: BorderRadius.circular(20.0)),
    );
  }
}
//   final User user;
//   TeacherHomePage({this.user});
//   final _key = GlobalKey<FormState>();

//   // ignore: non_constant_identifier_names
//   Future SendData() async {
//     // ignore: unused_local_variable
//     final db = FirebaseFirestore.instance.collection("Userinfo").add({
//       'name': "Tuhin",
//       'roll': 35000117019.toString(),
//       'number': 75000117019,
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Presence"),
//         centerTitle: true,
//         actions: <Widget>[
//           IconButton(icon: Icon(Icons.photo), onPressed: () {})
//         ],
//       ),
//       body: Container(
//           padding: EdgeInsets.all(32),
//           child: Form(
//             key: _key,
//             child: Column(
//                 //   mainAxisAlignment: MainAxisAlignment.end,
//                 children: <Widget>[
//                   TextFormField(
//                     decoration: const InputDecoration(
//                       icon: Icon(Icons.person),
//                       hintText: 'What do people call you?',
//                       labelText: 'Name *',
//                     ),
//                     validator: (value) {
//                       if (value.isEmpty) {
//                         return "Can't be empty";
//                       } else if (value.length <= 10) {
//                         return "Should be greater than 10";
//                       } else
//                         return null;
//                     },
//                   ),
//                   TextFormField(
//                     decoration: const InputDecoration(
//                       icon: Icon(Icons.subject),
//                       hintText: 'What is the topic?',
//                       labelText: 'Subject *',
//                     ),
//                     validator: (value) {
//                       if (value.isEmpty) {
//                         return "Can't be empty";
//                       } else if (value.length <= 5) {
//                         return "Should be greater than 5";
//                       } else
//                         return null;
//                     },
//                   ),
                  
//                   FlatButton(
//                     child: Text("Validate"),
//                     color: Colors.blue,
//                     textColor: Colors.white,
//                     onPressed: () {
//                       if (_key.currentState.validate()) {
//                         SendData();
//                       }
//                     },
//                   ),
//                   Text(user.email.toString()),
//                   RaisedButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => LoginPage()),
//                       );
//                     },
//                     child: Text("Sign Out"),
//                   )
//                 ]),
//           )),
//     );
//   }
// }
