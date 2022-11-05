import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'onboard_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

//We use the SingleTickerProviderStateMixin and animations for the
//animations we're applying to the splash screen
class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> sizeHeight;
  late Animation<double> sizeWidth;
  late Animation<double> logoVisible;

  @override
  void initState() {
    super.initState();

    //Lock the splash page in one orientation so it doesn't
    //react to screen changes
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    //Set up the total duration for our animation and initialize variables
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    sizeHeight = Tween(begin: 0.0, end: 80.0).animate(CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 1.0, curve: Curves.decelerate)));
    sizeWidth = Tween(begin: 0.0, end: 242.0).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 1.0, curve: Curves.decelerate),
    ));
    logoVisible = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 1.0, curve: Curves.decelerate),
    ));
    _controller.forward();
    _controller.addListener(() {
      setState(() {});
    });

    //The timer helps us make a count which performs a callback on count elapsed
    //our splash screen would automatically move after 4 seconds
    Timer(
        const Duration(seconds: 4),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const OnboardScreen(),
            )));
  }

//Dispose our orientation settings so that the orientation we forced
//applies to only this page
  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Color(0xff79A7D3),
                  Color(0xff6883BC),
                ])),
          ),
          Positioned(
              left: 243.w,
              top: 38.h,
              child: SvgPicture.asset('assets/images/splash.svg')),
          Positioned(
              left: 25.w,
              top: 249.h,
              child: SvgPicture.asset('assets/images/splash.svg')),
          Positioned(
              left: 243.w,
              top: 447.h,
              child: SvgPicture.asset('assets/images/splash.svg')),
          Positioned(
              left: 16.w,
              top: 630.h,
              child: SvgPicture.asset('assets/images/splash.svg')),
          Center(
            child: Opacity(
              opacity: logoVisible.value,
              child: SizedBox(
                  height: sizeHeight.value,
                  width: sizeWidth.value,
                  child: Text('rezoomay',
                      style: GoogleFonts.lobster(
                          color: Colors.white,
                          fontSize: 64.sp,
                          fontWeight: FontWeight.w400))),
            ),
          )
        ],
      ),
    );
  }
}
