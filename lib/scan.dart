import 'package:barcode_scan/barcode_scan.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ScanPage extends StatefulWidget {
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  String _qrCodeResult = "Not Yet Scanned";
  var _isScanned = false;

  Future<void> _sendData() async {
    final response =
        await FirebaseFirestore.instance.collection("Attendence").add({
      'roll': _qrCodeResult,
      'dateTime': DateFormat('yyyy-MM-dd hh:mm:ss').format(DateTime.now()),
    });
    print(response);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scanner"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              "Result",
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(
              _qrCodeResult,
              style: TextStyle(
                fontSize: 20.0,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20.0,
            ),
            _isScanned
                ? TextButton(
                    onPressed: _sendData,
                    child: Text(
                      "Submit",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.all(15.0),

                      // primary: Colors.white,
                      // backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.blue, width: 3.0),
                          borderRadius: BorderRadius.circular(20.0)),
                    ),
                  )
                : TextButton(
                    onPressed: () async {
//
                      String codeSanner =
                          await BarcodeScanner.scan(); //barcode scnner
                      print('here-------->$codeSanner');
                      setState(() {
                        _qrCodeResult = codeSanner;
                        _isScanned = true;
                      });

                      // try{
                      //   BarcodeScanner.scan()    this method is used to scan the QR code
                      // }catch (e){
                      //   BarcodeScanner.CameraAccessDenied;   we can print that user has denied for the permisions
                      //   BarcodeScanner.UserCanceled;   we can print on the page that user has cancelled
                      // }
                    },
                    child: Text(
                      "Open Scanner",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.all(15.0),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.blue, width: 3.0),
                          borderRadius: BorderRadius.circular(20.0)),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  //its quite simple as that you can use try and catch staatements too for platform exception
}