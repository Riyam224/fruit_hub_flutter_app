import 'package:flutter/material.dart';
import 'package:fruit_store_app/constants.dart';
import 'package:fruit_store_app/core/services/shared_prefernces_singleton.dart';
import 'package:fruit_store_app/features/auth/presentation/views/login_view.dart';
import 'package:svg_flutter/svg.dart';
import 'package:fruit_store_app/core/utils/app_text_styles.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem(
      {super.key,
      required this.image,
      required this.backgroundImage,
      required this.subtitle,
      required this.title,
      required this.isVisible});

  final String image, backgroundImage;
  final String subtitle;
  final Widget title;
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(
                  backgroundImage,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SvgPicture.asset(
                  image,
                ),
              ),
              Visibility(
                visible: isVisible,
                child: GestureDetector(
                  onTap: () {
                    SharedPreferencesSingleton.setBool(
                        kOnBoardingViewSeen, true);
                    Navigator.pushReplacementNamed(
                        context, LoginView.routeName);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('تخط',
                        style: TextStyles.regular13.copyWith(
                          color: Color(0xff0c8ce9),
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 64,
        ),
        title,
        SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 37,
          ),
          child: Text(subtitle,
              textAlign: TextAlign.center,
              style: TextStyles.semiBold13.copyWith(
                color: Color(0xffa6aaaa),
              )),
        ),
      ],
    );
  }
}
