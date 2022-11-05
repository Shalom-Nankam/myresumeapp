import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_resume_app/widgets/footer.dart';
import 'package:my_resume_app/widgets/social_media_tile.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../providers/theme_provider.dart';
import '../widgets/custom_text.dart';

class SocialScreen extends StatelessWidget {
  SocialScreen({super.key});

//This method helps us run the URLs in the app using the url_launcher package
  Future<void> openUrl(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

//The URLs to be used
  final Uri twitter = Uri.https('twitter.com', 'S_K_A_feeds');
  final Uri linkedIn = Uri.https('linkedin.com', 'in/shalomabrokwah');

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    final themer = Provider.of<ThemeProvider>(context);
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
            text: 'social',
            size: isPortrait ? 16 : 30,
            color: Colors.white,
            weight: FontWeight.w700),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 17.h),
              child: Column(
                children: [
                  SizedBox(
                    height: 72.h,
                    width: 333.w,
                    child: CustomText(
                      text: 'connect',
                      size: isPortrait ? 24 : 36,
                      color: themer.darkTheme
                          ? Colors.white
                          : const Color(0xff000000),
                      weight: FontWeight.w400,
                      align: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 38.h,
                  ),
                  SocialHandle(
                      icon: FaIcon(
                        FontAwesomeIcons.twitter,
                        size: isPortrait ? 22.h : 48.h,
                        color: Colors.blue,
                      ),
                      media: 'twitter',
                      press: () => openUrl(twitter)),
                  SizedBox(
                    height: 38.h,
                  ),
                  SocialHandle(
                      icon: FaIcon(
                        FontAwesomeIcons.linkedin,
                        size: isPortrait ? 22.h : 48.h,
                        color: Colors.blue,
                      ),
                      media: 'linkedin',
                      press: () => openUrl(linkedIn)),
                ],
              ),
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
