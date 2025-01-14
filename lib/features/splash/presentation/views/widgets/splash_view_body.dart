import 'package:flutter/material.dart';
import 'package:fruit_store_app/constants.dart';
import 'package:fruit_store_app/core/services/shared_prefernces_singleton.dart';
import 'package:fruit_store_app/core/utils/app_images.dart';
import 'package:fruit_store_app/features/auth/presentation/views/login_view.dart';
import 'package:fruit_store_app/features/on_boarding/presentation/views/on_boarding_view.dart';

import 'package:svg_flutter/svg.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    excuteNavigation();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset(Assets.imagesPlant),
          ],
        ),
        SvgPicture.asset(Assets.imagesLogo),
        SvgPicture.asset(
          Assets.imagesSplashBottom,
          fit: BoxFit.fill,
        ),
      ],
    );
  }

  // todo

  void excuteNavigation() {
    bool isOnBoardingViewSeen =
        SharedPreferencesSingleton.getBool(kOnBoardingViewSeen);
    Future.delayed(const Duration(seconds: 2), () {
      if (isOnBoardingViewSeen) {
        Navigator.pushReplacementNamed(context, LoginView.routeName);
      } else {
        Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
      }
    });
  }
}
