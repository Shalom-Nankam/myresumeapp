import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_resume_app/providers/language_provider.dart';
import 'package:my_resume_app/providers/theme_provider.dart';
import 'package:provider/provider.dart';

import 'custom_text.dart';

class Footer extends StatelessWidget {
  final BuildContext mycontext;
  const Footer({
    Key? key,
    required this.mycontext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final changeTheme = Provider.of<ThemeProvider>(context);
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    final local = Provider.of<LanguageProvider>(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
      height: isPortrait ? 100.h : 130.h,
      width: double.infinity.w,
      color: const Color(0xff6883BC),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              TextButton(
                onPressed: () {
                  if (changeTheme.darkTheme) {
                    return changeTheme.appDarkTheme(false);
                  } else {
                    return changeTheme.appDarkTheme(true);
                  }
                },
                child: CustomText(
                    text:
                        changeTheme.darkTheme ? 'switch_light' : 'switch_dark',
                    size: isPortrait ? 17 : 24,
                    color: Colors.white,
                    weight: FontWeight.w700),
              ),
              SizedBox(
                width: 20.w,
              ),
              TextButton(
                  onPressed: () async {
                    if (local.isFrench) {
                      mycontext.setLocale(const Locale('en'));
                      local.setFrench(false);
                      return;
                    } else {
                      mycontext.setLocale(const Locale('fr'));
                      local.setFrench(true);
                      return;
                    }
                  },
                  child: local.isFrench
                      ? Text(
                          'To English',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: isPortrait ? 16.sp : 24.sp),
                        )
                      : Text(
                          'To French',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: isPortrait ? 16.sp : 24.sp),
                        )
                  // CustomText(
                  //     text: local.isFrench ? 'To English' : 'To French',
                  //     size: isPortrait ? 16 : 24,
                  //     color: Colors.white,
                  //     weight: FontWeight.w700),
                  ),
            ],
          )
        ],
      ),
    );
  }
}
