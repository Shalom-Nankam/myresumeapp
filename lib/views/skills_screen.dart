import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_resume_app/widgets/custom_text.dart';
import 'package:my_resume_app/widgets/footer.dart';
import 'package:my_resume_app/widgets/skill_tile.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios,
            size: isPortrait ? 20.w : 15.w,
          ),
        ),
        title: CustomText(
            text: 'skills',
            size: isPortrait ? 16 : 30,
            color: Colors.white,
            weight: FontWeight.w700),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return const PortraitView();
          }
          return const LandscpeView();
        },
      ),
    );
  }
}

class PortraitView extends StatelessWidget {
  const PortraitView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themer = Provider.of<ThemeProvider>(context);
    return SafeArea(
      bottom: false,
      child: SizedBox(
        child: Column(
          children: [
            Container(
              height: 700.h,
              padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 17.h),
              child: ListView(
                children: [
                  CustomText(
                    text: 'offers',
                    size: 24,
                    color: themer.darkTheme
                        ? Colors.white
                        : const Color(0xff000000),
                    weight: FontWeight.w400,
                    align: TextAlign.center,
                  ),
                  SizedBox(
                    height: 38.h,
                  ),
                  const SkillTile(
                      skill: 'flutter',
                      description: 'flutter_exp',
                      icon: FlutterLogo()),
                  SizedBox(
                    height: 48.h,
                  ),
                  SkillTile(
                      skill: 'python',
                      description: 'python_exp',
                      icon: FaIcon(
                        FontAwesomeIcons.python,
                        size: 22.h,
                        color: Colors.blue,
                      )),
                  SizedBox(
                    height: 48.h,
                  ),
                  SkillTile(
                      skill: 'git',
                      description: 'git_exp',
                      icon: FaIcon(
                        FontAwesomeIcons.github,
                        size: 22.h,
                        color: Colors.blue,
                      )),
                  SizedBox(
                    height: 48.h,
                  ),
                  SkillTile(
                      skill: 'it',
                      description: 'it_exp',
                      icon: FaIcon(
                        FontAwesomeIcons.shield,
                        size: 22.h,
                        color: Colors.blue,
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 22.h,
            ),
            Footer(
              mycontext: context,
            )
          ],
        ),
      ),
    );
  }
}

class LandscpeView extends StatelessWidget {
  const LandscpeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themer = Provider.of<ThemeProvider>(context);
    return SafeArea(
      // bottom: false,
      child: SizedBox(
        child: ListView(
          children: [
            Column(
              children: [
                CustomText(
                  text: 'offers',
                  size: 36,
                  color:
                      themer.darkTheme ? Colors.white : const Color(0xff000000),
                  weight: FontWeight.w400,
                  align: TextAlign.center,
                ),
                SizedBox(
                  height: 38.h,
                ),
                const SkillTile(
                    skill: 'flutter',
                    description: 'flutter_exp',
                    icon: FlutterLogo()),
                SizedBox(
                  height: 48.h,
                ),
                SkillTile(
                    skill: 'python',
                    description: 'python_exp',
                    icon: FaIcon(
                      FontAwesomeIcons.python,
                      size: 45.h,
                      color: Colors.blue,
                    )),
                SizedBox(
                  height: 48.h,
                ),
                SkillTile(
                    skill: 'git',
                    description: 'git_exp',
                    icon: FaIcon(
                      FontAwesomeIcons.github,
                      size: 45.h,
                      color: Colors.blue,
                    )),
                SizedBox(
                  height: 48.h,
                ),
                SkillTile(
                    skill: 'it',
                    description: 'it_exp',
                    icon: FaIcon(
                      FontAwesomeIcons.shield,
                      size: 45.h,
                      color: Colors.blue,
                    )),
              ],
            ),
            SizedBox(
              height: 50.h,
            ),
            Footer(
              mycontext: context,
            )
          ],
        ),
      ),
    );
  }
}
