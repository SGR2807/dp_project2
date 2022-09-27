

import 'package:dproject/blue.dart';
import 'package:dproject/qr.dart';
import 'package:flutter/material.dart';
import 'package:dproject/screens/login.dart';
import 'package:dproject/screens/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


  
Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
} 


class HomePage extends StatelessWidget {
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.greenAccent,

      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            // even space distribution
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "Welcome",
                    style: TextStyle(
                      fontFamily: 'Rancho',
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      fontSize: 40,

                    ),

                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Welcome to BiTLock",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Rancho',
                      color: Colors.grey,
                      fontSize: 20,

                    ),),
                    SizedBox(
                      height: 350,
                    ),
                    Text(
                      "Already Have an Account?",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Rancho',
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                ],
              ),


              Column(
                children: <Widget>[
                  
                  SizedBox(height:20),
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    // defining the shape
                    color: Colors.orange,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)
                    ),

                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Rancho',
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  // creating the signup button
                  SizedBox(height:20),
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> qrwrite()));

                    },
                    color: Colors.orange,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)
                    ),
                    child: Text(
                      "Scan a QR",
                      style: TextStyle(
                          fontFamily: 'Rancho',
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18
                      ),
                    ),
                  )

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

