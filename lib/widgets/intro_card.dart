import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_resume_app/widgets/custom_text.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

class IntroductionCard extends StatelessWidget {
  const IntroductionCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    final themer = Provider.of<ThemeProvider>(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 17.h),
      height: isPortrait ? 328.h : 350.h,
      width: isPortrait ? 370.w : 200.w,
      decoration: BoxDecoration(
          color: const Color(0xff79A7D3).withOpacity(0.2),
          borderRadius: BorderRadius.circular(10).r),
      child: Column(
        children: [
          Text(
            'Abrokwah Shalom Nankam',
            style: GoogleFonts.nunito(
                color:
                    themer.darkTheme ? Colors.white : const Color(0xff000000),
                fontSize: isPortrait ? 24.sp : 30.sp,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 17.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  width: isPortrait ? 208.w : 90.w,
                  height: 208.h,
                  child: ClipRRect(
                    borderRadius: BorderRadius.zero,
                    child: Image.asset(
                      'assets/images/dp.jpeg',
                    ),
                  )),
              SizedBox(
                width: isPortrait ? 25.w : 0.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomText(
                      text: 'title',
                      size: isPortrait ? 16 : 24,
                      color: themer.darkTheme
                          ? Colors.white
                          : const Color(0xff000000),
                      weight: FontWeight.w700),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    'Mr',
                    style: GoogleFonts.poppins(
                        color: themer.darkTheme
                            ? Colors.white
                            : const Color(0xff000000),
                        fontWeight: FontWeight.w400,
                        fontSize: isPortrait ? 16.sp : 24.sp),
                  ),
                  SizedBox(
                    height: 39.h,
                  ),
                  CustomText(
                      text: 'uname',
                      size: isPortrait ? 16 : 24,
                      color: themer.darkTheme
                          ? Colors.white
                          : const Color(0xff000000),
                      weight: FontWeight.w700),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    'Kham',
                    style: GoogleFonts.poppins(
                        color: themer.darkTheme
                            ? Colors.white
                            : const Color(0xff000000),
                        fontWeight: FontWeight.w400,
                        fontSize: isPortrait ? 16.sp : 24.sp),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
