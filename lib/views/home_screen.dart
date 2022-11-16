import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:package_info_plus/package_info_plus.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final themer = Provider.of<ThemeProvider>(context);
    // bool isPortrait =
    //     MediaQuery.of(context).orientation == Orientation.portrait;

    //WillPopScope ensures that we can handle what happens when a user taps the
    //back navigation button on android while on this page. This action will
    //normally close the app so we inform the user before time.
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Do you want to leave the app?'),
              actionsAlignment: MainAxisAlignment.spaceEvenly,
              actions: [
                TextButton(
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                  child: const Text(
                    'Yes',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: const Text(
                    'No',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            );
          },
        );
        return shouldPop!;
      },
      child: Scaffold(
        body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              SizedBox(
                height: 50.h,
              ),
              FutureBuilder<PackageInfo>(
                future: PackageInfo.fromPlatform(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        Text(snapshot.data!.packageName),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(snapshot.data!.appName),
                      ],
                    );
                  }
                  return const CircularProgressIndicator(
                    color: Colors.grey,
                  );
                },
              )
            ],
            // children: [
            //   SizedBox(
            //     height: isPortrait ? 779.h : 740.h,
            //     width: double.infinity.w,
            //     child: SingleChildScrollView(
            //       child: Column(
            //         children: [
            //           SizedBox(
            //             height: 35.h,
            //             width: double.infinity.w,
            //           ),
            //           Padding(
            //             padding: isPortrait
            //                 ? EdgeInsets.symmetric(horizontal: 29.w)
            //                 : EdgeInsets.symmetric(horizontal: 70.w),
            //             child: const IntroductionCard(),
            //           ),
            //           SizedBox(height: 71.h),
            //           Row(
            //             children: [
            //               SizedBox(
            //                 width: isPortrait ? 115.w : 165.w,
            //                 child: Divider(
            //                   color: Colors.grey.shade600,
            //                   thickness: 0.8.h,
            //                   height: isPortrait ? 5.h : 20.h,
            //                 ),
            //               ),
            //               SizedBox(
            //                 width: 2.w,
            //               ),
            //               CustomText(
            //                   text: 'prof',
            //                   size: isPortrait ? 16 : 24,
            //                   color: themer.darkTheme
            //                       ? Colors.white
            //                       : const Color(0xff000000),
            //                   weight: FontWeight.w400),
            //               SizedBox(
            //                 width: 2.w,
            //               ),
            //               SizedBox(
            //                 width: isPortrait ? 128.w : 157.w,
            //                 child: Divider(
            //                   color: Colors.grey.shade600,
            //                   thickness: 0.8.h,
            //                   height: 5.h,
            //                 ),
            //               ),
            //             ],
            //           ),
            //           Container(
            //             padding: EdgeInsets.symmetric(
            //                 horizontal: 36.w, vertical: 49.h),
            //             height: 216.h,
            //             width: double.infinity.w,
            //             decoration: BoxDecoration(
            //               color: const Color(0xff8A307F).withOpacity(0.2),
            //             ),
            //             child: CustomText(
            //                 text: 'summmary',
            //                 size: isPortrait ? 15 : 24,
            //                 color: themer.darkTheme
            //                     ? Colors.white
            //                     : const Color(0xff000000),
            //                 weight: FontWeight.w400),
            //           ),
            //           SizedBox(
            //             height: 58.h,
            //           ),
            //           SizedBox(
            //             height: 80.h,
            //             width: 248.w,
            //             child: CustomText(
            //               text: 'know',
            //               size: isPortrait ? 24 : 32,
            //               color: themer.darkTheme
            //                   ? Colors.white
            //                   : const Color(0xff000000),
            //               weight: FontWeight.w400,
            //               align: TextAlign.center,
            //             ),
            //           ),
            //           SizedBox(
            //             height: 79.h,
            //           ),
            //           CustomCard(
            //             press: () => Navigator.push(
            //                 context,
            //                 MaterialPageRoute(
            //                   builder: (context) => const SkillsScreen(),
            //                 )),
            //             image: Image.asset(
            //               'assets/images/skills.webp',
            //               fit: BoxFit.fill,
            //             ),
            //             title: 'skills',
            //           ),
            //           SizedBox(
            //             height: 47.h,
            //           ),
            //           CustomCard(
            //             press: () => Navigator.push(
            //                 context,
            //                 MaterialPageRoute(
            //                   builder: (context) => SocialScreen(),
            //                 )),
            //             image: Image.asset(
            //               'assets/images/social.jpeg',
            //               fit: BoxFit.fill,
            //             ),
            //             title: 'social',
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            //   // SizedBox(
            //   //   height: 10.h,
            //   // ),
            //   Footer(
            //     mycontext: context,
            //   )
            // ],
          ),
        ),
      ),
    );
  }
}
