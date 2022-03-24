// import 'dart:js';

// import 'package:fingerprint/screens/home1.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:local_auth/local_auth.dart';


// class HomeServices {
//   bool? hasbiosensor;
//   LocalAuthentication authentication = LocalAuthentication();

//   Future<void> checkbio() async {
//     try {
//       hasbiosensor = await authentication.canCheckBiometrics;
//       print(hasbiosensor);
//       if (hasbiosensor!) {
//         _getauth();
//       }
//       _getauth();
//     } on PlatformException catch (e) {
//       print(e);
//     }
//   }

//   Future<void> _getauth() async {
//     bool isauth = false;
//     try {
//       isauth = await authentication.authenticate(
//         localizedReason: 'Scan your finger print to acess the age',
//         biometricOnly: true,
//         useErrorDialogs: true,
//         stickyAuth: true,
//         sensitiveTransaction: false,
//       );

//       if (isauth) {
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => Home1()));
//       }
//       print(isauth);
//     } on PlatformException catch (e) {
//       print(e);
//     }
//   }
// }
