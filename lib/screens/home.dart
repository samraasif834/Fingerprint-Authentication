import 'package:fingerprint/screens/home1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:local_auth/local_auth.dart';

import '../variable.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

    LocalAuthentication authentication = LocalAuthentication();
    bool? hasbiosensor;
 
  Future<void> checkbio() async {
    try {
      hasbiosensor = await authentication.canCheckBiometrics;
      print(hasbiosensor);
      if (hasbiosensor!) {
        _getauth();
      }
      _getauth();
    } on PlatformException catch (e) {
      print(e);
    }
  }

   Future<void> _getauth() async {
    bool isauth = false;
    try {
      isauth = await authentication.authenticate(
        localizedReason: 'Scan your finger print to acess the age',
        biometricOnly: true,
        useErrorDialogs: true,
        stickyAuth: true,
        sensitiveTransaction: false,
      );

      if (isauth) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home1()));
      }
      print(isauth);
    } on PlatformException catch (e) {
      print(e);
    }
  }
  // HomeServices home = HomeServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  checkbio();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(203, 180, 224, 1.0),
          title: Text("Finger Print Scanning"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 180, left: 50),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 45),
                    child: Text("Welcome.",
                        style: GoogleFonts.oswald(
                          fontSize: 55,
                          color: Color1,
                        )

                        // TextStyle(fontSize: 75,color: Color1,fontStyle: FontStyle),
                        ),
                  ),
                  //  Lottie.network('https://assets3.lottiefiles.com/packages/lf20_8vjjxhwh.json',animate: true),
                  Expanded(
                      child: Lottie.network(
                          'https://assets3.lottiefiles.com/packages/lf20_d00u59ww.json',
                          animate: true)),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
                height: 40,
                width: 250,
                child: ElevatedButton(
                    onPressed: () {
                      checkbio();
                    },
                    style: ElevatedButton.styleFrom(primary: Color1),
                    child: Text(
                      "Tap for Verfication",
                      style: GoogleFonts.oswald(fontSize: 20),
                    )))
          ],
        ));
  }
}
