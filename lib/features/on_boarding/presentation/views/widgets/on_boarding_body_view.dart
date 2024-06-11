import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruit_store_app/constants.dart';
import 'package:fruit_store_app/core/services/shared_prefernces_singleton.dart';
import 'package:fruit_store_app/core/utils/app_colors.dart';
import 'package:fruit_store_app/core/widgets/custom_button.dart';
import 'package:fruit_store_app/features/auth/presentation/views/login_view.dart';
import 'package:fruit_store_app/features/on_boarding/presentation/views/widgets/on_boarding_page_view.dart';

class OnBoardingBodyView extends StatefulWidget {
  const OnBoardingBodyView({super.key});

  @override
  State<OnBoardingBodyView> createState() => _OnBoardingBodyViewState();
}

class _OnBoardingBodyViewState extends State<OnBoardingBodyView> {
  late PageController pageController;
  var currentPage = 0;

  @override
  void initState() {
    // TODO: implement initState

    pageController = PageController();
    pageController.addListener(() {
      currentPage = pageController.page!.round();
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: OnBoardingPageView(
            pageController: pageController,
          ),
        ),
        DotsIndicator(
          dotsCount: 2,
          decorator: DotsDecorator(
            activeColor: AppColors.primaryColor,
            color: currentPage == 1
                ? AppColors.primaryColor
                : AppColors.primaryColor.withOpacity(0.5),
          ),
        ),
        SizedBox(
          height: 23,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kHorizontalPadding,
          ),
          child: Visibility(
            visible: currentPage == 1 ? true : false,
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            child: CustomButton(
              onPressed: () {
                SharedPreferencesSingleton.setBool(kOnBoardingViewSeen, true);
                Navigator.pushReplacementNamed(context, LoginView.routeName);
              },
              text: 'ابدأ الان',
            ),
          ),
        ),
        SizedBox(
          height: 43,
        ),
      ],
    );
  }
}
