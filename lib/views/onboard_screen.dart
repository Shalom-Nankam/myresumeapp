import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_resume_app/providers/theme_provider.dart';
import 'package:my_resume_app/views/home_screen.dart';
import 'package:my_resume_app/widgets/custom_text.dart';
import 'package:my_resume_app/widgets/footer.dart';
import 'package:provider/provider.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  @override
  Widget build(BuildContext context) {
    //This helps us in managing the state using the provider 'ThemeProvider'
    final themer = Provider.of<ThemeProvider>(context);

    //We use this variable to setting widget properties depending on the
    //device orientation
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 70.w, vertical: 58.h),
              child: Column(
                children: [
                  CustomText(
                      text: 'welcome',
                      size: 48,
                      color: themer.darkTheme
                          ? Colors.white
                          : const Color(0xff000000),
                      weight: FontWeight.w400),
                  SizedBox(
                    height: 49.h,
                  ),
                  CustomText(
                      text: 'to',
                      size: 48,
                      color: themer.darkTheme
                          ? Colors.white
                          : const Color(0xff000000),
                      weight: FontWeight.w400),
                  SizedBox(
                    height: 44.h,
                  ),
                  Text('rezoomay',
                      style: GoogleFonts.lobster(
                          color: const Color(0xff8A307F),
                          fontSize: 64.sp,
                          fontWeight: FontWeight.w400)),
                  SizedBox(
                    height: 49.h,
                  ),
                  CustomText(
                    text: 'intro',
                    size: isPortrait ? 16 : 22,
                    color: themer.darkTheme
                        ? Colors.white
                        : const Color(0xff000000),
                    weight: FontWeight.w400,
                    align: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 69.h,
            ),
            MaterialButton(
              onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  )),
              color: const Color(0xff79A7D3),
              height: isPortrait ? 71.h : 80.h,
              minWidth: isPortrait ? 288.w : 100.w,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16).r),
              child: Text(
                'start',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: isPortrait ? 14.sp : 22.sp,
                  fontWeight: FontWeight.w500,
                ),
              ).tr(),
            ),
            const Spacer(),
            Footer(
              mycontext: context,
            )
          ],
        ),
      ),
    );
  }
}
