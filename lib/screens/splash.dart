import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:login_auth/screens/intro_screen.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Container(
        child: Center(
          child: Image.asset(
            'assets/images/FlowXpert.png',
            height: 150, 
          ),
        ),
      ),
      nextScreen: OnboardingScreen(),
      duration: 1000,
      splashTransition: SplashTransition.slideTransition,

    );
  }
}
