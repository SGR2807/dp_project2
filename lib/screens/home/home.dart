import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dproject/utils/components.dart';
import 'package:dproject/screens/login.dart';
import 'package:dproject/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';

class Home extends StatelessWidget {
  FirebaseAuth _auth = FirebaseAuth.instance;
  // const Home({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
              color: Colors.greenAccent,
            ),
      child:Stack(
        children: <Widget>[

        Container(
          padding: EdgeInsets.fromLTRB(20, 50, 0, 0),
          child: Text('home')
        ),

      Container(
        padding: EdgeInsets.fromLTRB(20, 150, 0, 0),
        child: ElevatedButton(
          onPressed: () {
            _auth.signOut();
            Navigator.pop(context);
          },
          child: Text('Sign Out')),
      )
        ]
      )
    );
  }
}