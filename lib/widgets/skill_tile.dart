import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_resume_app/providers/theme_provider.dart';
import 'package:my_resume_app/widgets/custom_text.dart';
import 'package:provider/provider.dart';

class SkillTile extends StatelessWidget {
  const SkillTile(
      {super.key,
      required this.skill,
      required this.description,
      required this.icon});
  final String skill, description;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    final themer = Provider.of<ThemeProvider>(context);
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Container(
      decoration: BoxDecoration(
          color: themer.darkTheme ? Colors.white : Colors.black12,
          borderRadius: BorderRadius.circular(16).r),
      height: isPortrait ? 100.h : 165.h,
      width: isPortrait ? 373.w : 290.w,
      child: Center(
        child: ExpansionTile(
          iconColor: Colors.black12,
          collapsedIconColor: Colors.black,
          childrenPadding: EdgeInsets.symmetric(horizontal: 10.w),
          expandedAlignment: Alignment.centerLeft,
          leading: Container(
            height: isPortrait ? 49.h : 90.h,
            width: isPortrait ? 49.w : 90.h,
            decoration: BoxDecoration(
                color: const Color(0xff8A307F).withOpacity(0.2),
                borderRadius: BorderRadius.circular(100).r),
            child: Center(
              child: icon,
            ),
          ),
          title: CustomText(
              text: skill,
              size: isPortrait ? 14 : 26,
              color: Colors.black,
              weight: FontWeight.w400),
          children: [
            CustomText(
                text: description,
                size: isPortrait ? 12 : 22,
                color: Colors.black,
                weight: FontWeight.w400),
          ],
        ),
      ),
    );
  }
}
