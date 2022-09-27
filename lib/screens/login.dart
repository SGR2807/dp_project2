// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:dproject/qr.dart';
// import 'package:dproject/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'signup.dart';
import 'package:dproject/blue.dart';
// import 'package:dproject/screens/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dproject/qr.dart';


class LoginPage extends StatelessWidget {
  // final AuthService _auth = AuthService();
  FirebaseAuth _auth = FirebaseAuth.instance;
  String username = '';
  String password = '';
  bool loginObscure = true;
  bool invalidCredentials = false;
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(

        resizeToAvoidBottomInset: false,
        body: Container(
            decoration: BoxDecoration(
              color: Colors.greenAccent,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 50, 0, 0),
                        child: Text(
                          'Welcome to',
                          style: TextStyle(
                            fontFamily: 'Rancho',
                            color: Colors.orange,
                            letterSpacing: 2.0,
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 95, 0, 0),
                        child: Text(
                          'BITLOCK',
                          style: TextStyle(
                            fontFamily: 'Rancho',
                            color: Colors.orange,
                            letterSpacing: 2.0,
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20, top: 55, right: 20),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        onChanged: (value){
                          username = value;
                        },
                       style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color:Colors.blue)
                                        ),
                                              focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color:Colors.blue)
                                            ),
                            labelText: 'Email',
                            labelStyle: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Rancho',
                                color: Colors.grey)),
                      ),
                      SizedBox(height: 14),
                      TextField(
                        onChanged: (value){
                          password = value;
                        },
                        obscureText: loginObscure,
                        
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color:Colors.blue)
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color:Colors.blue)
                            ),
                            labelText: 'Password',
                            labelStyle: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Rancho',
                                color: Colors.grey)),
                        
                      ),
                      Visibility(
                          visible: invalidCredentials,
                          child: Center(child: Text('Invalid Username or password entered', style: TextStyle(color: Colors.red)))
                      ),
                      
                      SizedBox(height: 40),
                      Container(
                        child: Row(
                          children: <Widget>[
                            SizedBox(width: 0),
                            InkWell(
                              onTap: () async{
                                try{
                                  final user = await _auth.signInWithEmailAndPassword(email: username, password: password);
                                  if (user != null) {
                                    // Navigator.pushNamed(context, '/blue');
                                    print('User logged in');
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => FlutterBlueApp()));
                                  }
                                }catch(e){
                                  print('wrong password');
                                  CupertinoAlertDialog(
                                    title: Text("Wrong Password"),
                                  );
                                  print(e);
                                }
                              },
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                  color: Colors.orange,
                                  fontFamily: 'Rancho',
                                  decoration: TextDecoration.underline,
                                  letterSpacing: 2.0,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            // SizedBox(width: 210),
                            // Ink(
                            //   decoration: const ShapeDecoration(
                            //     color: Colors.blue,
                            //     shape: CircleBorder(),
                            //   ),
                            //   child: IconButton(
                            //     icon: Icon(
                            //       Icons.arrow_forward,
                            //       color: Colors.orange,
                            //     ),
                            //     color: Colors.white,
                            //     onPressed: () {
                            //       Navigator.push(
                            //           context,
                            //           MaterialPageRoute(
                            //               builder: (context) => FlutterBlueApp()));
                            //     },
                            //   ),
                            // ),
                          ],
                        ),
                        // padding: EdgeInsets.symmetric(vertical: 20.0 , horizontal: 50.0),
                        // child:ElevatedButton(
                        //   child: Text('Sign in'),
                        //   onPressed: () async {
                        //     dynamic result = await _auth.signInAnon();
                        //     if(result == null){
                        //       print('error signing in');
                        //     }else{
                        //       print('signed in');
                        //       print(result);
                        //     }
                        //   },
                        // )
                      )
                    ],
                  ),
                ),
                SizedBox(height: 2),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 40, 0, 0),
                  child: Text(
                    'New to BITLOCK?',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Rancho',
                      color: Colors.orange,
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
                SizedBox(width: 0.0),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignupPage()));
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          fontFamily: 'Rancho',
                          color: Colors.orange,
                          letterSpacing: 2.0,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                )
              ],
            )));
  }
}

// we will be creating a widget for text field
Widget inputFile({label, obscureText = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
      ),
      SizedBox(
        height: 5,
      ),
      TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey))),
      ),
      SizedBox(
        height: 10,
      )
    ],
  );
}
