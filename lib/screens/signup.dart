// import 'package:e_xchange/screens/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dproject/utils/components.dart';
import 'package:dproject/blue.dart';
import 'package:dproject/screens/home/home.dart';
import 'login.dart';
import 'package:flutter/rendering.dart';
import 'package:dproject/qrcode.dart';


class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}
String username = '';
String password = '';
bool formCompleted = false;

class _SignupPageState extends State<SignupPage> {
  void validateForm (){
    if(username.length != 0 && password.length > 5){
      formCompleted =true;
    }else{
      formCompleted = false;
    }
  }
  bool signupObscure = true;
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.greenAccent,
      body: SingleChildScrollView(
        child: Container(
          height: 900,
          child: Column(
            
            mainAxisSize: MainAxisSize.min,
            children:<Widget>[
            Container(
                padding: EdgeInsets.fromLTRB(20, 50, 20, 200),
                height: 550,
                width: double.infinity,
                child: Column(
                  
                  children: <Widget>[
                      SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            Text("Sign up",
                            style: TextStyle(
                              fontSize: 25,
                              fontFamily: 'Rancho',
                              fontWeight: FontWeight.bold,
                              color: Colors.orange,
                      
                            ),),
                            SizedBox(height: 20,),
                            Text("Create an account",
                              style: TextStyle(
                                  fontFamily: 'Rancho',
                                  fontSize: 18,
                                  color:Colors.grey),),
                      
                      
                          ],
                        ),
                      ),
                      Text('Username', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
                      TextField(
                        onChanged: (val){
                          username = val;
                          setState(() {validateForm();});
                        },
                        cursorColor: Colors.black,
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                        decoration: customBoxStyle.copyWith(
                          hintText: 'Enter your e-mail id'
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Text('Password', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
                      TextField(
                        onChanged: (val){
                          password = val;
                          setState(() {validateForm();});
                        },
                        cursorColor: Colors.black,
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                        obscureText: signupObscure,
                        decoration: customBoxStyle.copyWith(
                          suffixIcon: IconButton(
                            icon: Icon(Icons.remove_red_eye, color: Colors.grey),
                            onPressed: (){
                              setState(() {
                                signupObscure = signupObscure == true ? false : true;
                              });
                            },
                          ),
                            hintText: 'Minimum 6 characters required'
                        ),
                      ),
                      SizedBox(height: 5.0),
                      GestureDetector(
                        onTap: () async{
                          if(formCompleted){
                            
                            try{
                              final newUser = await _auth.createUserWithEmailAndPassword(email: username, password: password);
                              if(newUser != null){
                                Navigator.pushNamed(context, '/home');
                                
                              }
                            }catch(e){
                              print(e);
                            }
                          }else{
                            null;
                          }
                        },
                      ),
                  ],
                ),
              ),
            GestureDetector(
                        onTap: () async{
                          if(formCompleted){
                            
                            try{
                              final newUser = await _auth.createUserWithEmailAndPassword(email: username, password: password);
                              if(newUser != null){
                                Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginPage()));
                               
                              }
                            }catch(e){
                              print(e);
                            }
                          }else{
                            null;
                          }
                        },
            child:Container(
              alignment: Alignment.center,
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 10.0),
              margin: EdgeInsets.symmetric(horizontal: 15.0),
              child: Text('Sign up', style: TextStyle(fontSize: 20.0, color: Colors.white)),
              decoration: BoxDecoration(
                  color: formCompleted ? Color(0xff14279B) : Color(0xff14279B).withOpacity(0.5)
              ),
            ),
            ),
            
            Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Already have an account?",
                    style: TextStyle(
                    
                    color: Colors.grey,
                  ),),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                          fontFamily: 'Rancho',
                          color: Colors.orange,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w600,
                        fontSize: 15
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ],
          ),
        ), 
      ),
    );  
  }
}



// // we will be creating a widget for text field
// Widget inputFile({label, obscureText = false})
// {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: <Widget>[
//       Text(
//         label,
//         style: TextStyle(
//             color: Colors.grey,
//             fontSize: 15,
//             fontWeight: FontWeight.w400,
//         ),

//       ),
//       SizedBox(
//         height: 1,
//       ),
//       TextField(
//         obscureText: obscureText,
//         decoration: InputDecoration(
//             contentPadding: EdgeInsets.symmetric(vertical: 0,
//                 horizontal: 7),
//             enabledBorder: OutlineInputBorder(
//               borderSide: BorderSide(
//                   color: Colors.orange
//               ),

//             ),
//             border: OutlineInputBorder(
//                 borderSide: BorderSide(color: Colors.grey)
//             )
//         ),
//       ),
//       SizedBox(height: 7,)
//     ],
//   );
// }


