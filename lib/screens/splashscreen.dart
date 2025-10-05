// import 'package:crackit/screens/homepage.dart';
import 'package:crackit/screens/loginsignuipage.dart';
// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: Colors.white,
      splash: Image.asset("assets/c11.jpg"),
      splashIconSize: 1000,
      splashTransition: SplashTransition.fadeTransition,
      duration: 1900,
      pageTransitionType: PageTransitionType.fade,
      nextScreen: Loginsignuipage()
     ); 
   }
}