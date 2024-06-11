import 'package:flutter/material.dart';
import 'package:fruit_store_app/features/on_boarding/presentation/views/widgets/on_boarding_body_view.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  static const String routeName = 'onBoardingView';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: const Scaffold(
        body: OnBoardingBodyView(),
      ),
    );
  }
}
