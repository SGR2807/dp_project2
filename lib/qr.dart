import 'package:dproject/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:barcode_scan/barcode_scan.dart';
import 'package:dproject/blue.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
// import 'package:flutter/services.dart';

class qrwrite extends StatefulWidget {
  const qrwrite({Key? key}) : super(key: key);

  @override
  State<qrwrite> createState() => _qrwriteState();
}

class _qrwriteState extends State<qrwrite> {
  var result ="Scan your QR code here";
  // var qrResult;
  Future _scanQR() async {
    try{
      // var qrResult = await BarcodeScanner.scan();
      // below 2 lines added from stackoverflow
      ScanResult qrScanResult = await BarcodeScanner.scan();
      String qrResult = qrScanResult.rawContent;
      setState(() {
        result=qrResult as String;
        String s ="bitlock";
        if(result==s){
          Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage()));
        }
      });
    }on PlatformException catch(ex){
      if(ex.code == BarcodeScanner.cameraAccessDenied){
        setState(() {
         result = "Camera permission was denied";  
        });
      }
      else{
        setState(() {
          result="Unknown error $ex";
        });
      }
    }on FormatException{
      setState(() {
        result = "you have pressed back button";
      });
    }catch(ex){
      setState(() {
        result = "unknown error $ex";
      });
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Scanner'),
      ),
      body: Center(
        child: Text(result),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.camera_alt),
        label: Text('Scan'),
        onPressed: _scanQR,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}