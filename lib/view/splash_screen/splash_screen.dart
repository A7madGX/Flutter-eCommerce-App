import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:krispy_store/view/main_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        curve: Curves.bounceInOut,
        duration: 1000,
        backgroundColor: Colors.black,
        splashTransition: SplashTransition.slideTransition,
        splash: Image.asset(
          "assets/images/splash.png",
        ),
        splashIconSize: 400.w,
        nextScreen: const MainScreen());
  }
}
