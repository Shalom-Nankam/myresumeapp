import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';
import 'custom_text.dart';

class SocialHandle extends StatelessWidget {
  const SocialHandle(
      {super.key,
      required this.icon,
      required this.media,
      required this.press});

  final Widget icon;
  final String media;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    final themer = Provider.of<ThemeProvider>(context);
    return Container(
      decoration: BoxDecoration(
          color: themer.darkTheme ? Colors.white : Colors.black12,
          borderRadius: BorderRadius.circular(16).r),
      height: isPortrait ? 70.h : 150.h,
      width: isPortrait ? 373.w : 250.w,
      child: Center(
        child: ListTile(
          onTap: press,
          leading: Container(
            height: isPortrait ? 49.h : 100.h,
            width: isPortrait ? 49.w : 50.w,
            decoration: BoxDecoration(
                color: const Color(0xff8A307F).withOpacity(0.2),
                borderRadius: isPortrait
                    ? BorderRadius.circular(100).r
                    : BorderRadius.circular(50).r),
            child: Center(
              child: icon,
            ),
          ),
          title: CustomText(
              text: media,
              size: isPortrait ? 14 : 26,
              color: Colors.black,
              weight: FontWeight.w400),
        ),
      ),
    );
  }
}
