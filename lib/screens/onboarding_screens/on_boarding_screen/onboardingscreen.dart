import 'package:flutter/material.dart';

import 'package:flutter_overboard/flutter_overboard.dart';
import 'package:kifah/screens/main_screen.dart';

import 'package:page_transition/page_transition.dart';

import '../../../constant/style.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen>
    with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _globalKey = new GlobalKey<ScaffoldState>();
  bool isclicked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      body: OverBoard(
        allowScroll: true,
        pages: pages,
        showBullets: true,
        inactiveBulletColor: gris,
        activeBulletColor: drawercolor,
        nextText: 'تقدم',
        finishText: 'كافح',
        skipText: 'تخطي',
        buttonColor: black,
        skipCallback: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("كمل اقرا كلش"),
          ));
        },
        finishCallback: () async {
          setState(() {
            isclicked = true;
          });

          // Obtain shared preferences.
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setBool("isclicked", isclicked);

          Navigator.push(
              context,
              PageTransition(
                  duration: const Duration(
                    milliseconds: 400,
                  ),
                  type: PageTransitionType.leftToRight,
                  child: MainScreen()));
        },
      ),
    );
  }

  final pages = [
    PageModel(
        color: white,
        titleColor: black,
        bodyColor: black,
        imageAssetPath: 'assets/images/pflag.png',
        title: ' فلسطين',
        body:
            "معاناة الشعب الفلسطيني على مدى 75 ماضية، والتي تتضمن القمع والعنف والتهجير، تمثل واحدة من أكثر القضايا الإنسانية مأساوية في التاريخ . أليس من واجبنا أن نساهم في دعمهم؟",
        doAnimateImage: true),
    PageModel(
        color: maincolor,
        imageAssetPath: 'assets/images/pflag2.png',
        title: 'فلسطين قضية اسلامية',
        body:
            'ملزم علينا الدفاع عن فلسطين فهي ليست قضية عربية او انسانية بل هيا قضية اسلامية على اي احد مسلم نصرة اخيه المسلم المظلوم,لكن كيف سننصرهم',
        doAnimateImage: true),
    PageModel(
        titleColor: black,
        bodyColor: black,
        color: white,
        imageAssetPath: 'assets/images/savep.png',
        title: 'الدفاع عن فلسطين',
        body:
            'ربما اقصى ما يمكننا فعله هوا التعريف بالقضية و دحض اكاذيب العدو من خلال نشر مواقفنا و تضامننا لكن خوارزميات المواقع تقف ضدنا لذلك تطبيق كفاحي هو الحل من خلال تشفير رسائلنا,ماذا تنتظر ابدا كفاحك الان',
        doAnimateImage: true),
  ];
}
