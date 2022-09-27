import 'package:flutter/material.dart';
// import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class HeadClipper extends StatelessWidget {
  const HeadClipper({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      // clipper: WaveClipperTwo(flip: true),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 124, 237, 86),
                Color.fromARGB(255, 236, 215, 22),
              ],
            )
        ),
        height: MediaQuery.of(context).size.height * 0.3,
        child: Center(child: Text('TEXTIFY', style: TextStyle(fontSize: 35.0, letterSpacing: 2,color: Colors.white, fontWeight: FontWeight.w900))),
      ),
    );
  }
}

InputDecoration customBoxStyle = InputDecoration(
  filled: true,
  enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 2.0, color: Color.fromARGB(255, 124, 237, 86))
  ),
  focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 2.0, color: Color.fromARGB(255, 124, 237, 86))
  ),
);