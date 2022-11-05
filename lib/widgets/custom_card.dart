import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_text.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    required this.image,
    required this.title,
    required this.press,
  }) : super(key: key);
  final Widget image;
  final String title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return GestureDetector(
      onTap: press,
      child: Card(
        elevation: 10.h,
        child: SizedBox(
          width: isPortrait ? 288.w : 100.w,
          height: isPortrait ? 147.h : 200.h,
          child: Stack(
            children: [
              Positioned.fill(child: image),
              const Positioned.fill(
                  child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.transparent, Colors.black],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.6, 0.95],
                  ),
                ),
              )),
              Positioned(
                top: isPortrait ? 96.h : 150.h,
                left: 7.w,
                child: CustomText(
                    text: title,
                    size: isPortrait ? 20 : 24,
                    color: Colors.white,
                    weight: FontWeight.w400),
              )
            ],
          ),
        ),
      ),
    );
  }
}
