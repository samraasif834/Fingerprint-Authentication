import 'package:fingerprint/variable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class Home1 extends StatefulWidget {
  const Home1({ Key? key }) : super(key: key);

  @override
  State<Home1> createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color1,
      ),
      body: Column(
        children:[
          SizedBox(height: 30,),
          Center(child: Text("Finally you got verfied",style: GoogleFonts.oswald(
fontSize: 30,
color: Color1,
          ),
          ),),
          LottieBuilder.network('https://assets1.lottiefiles.com/packages/lf20_s4ai3hvq.json',height: 300,)
        ]
      ),
      
    );
  }
}