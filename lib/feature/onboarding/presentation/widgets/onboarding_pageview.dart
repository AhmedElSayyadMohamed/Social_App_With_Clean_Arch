import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:social_app/core/basics_shared_widgets/custom_text_button/custom_text_button.dart';
import 'package:social_app/core/router/routing_name.dart';
import 'package:social_app/feature/onboarding/presentation/business_logic/states.dart';
import 'package:social_app/utils/app_padding/app_padding.dart';
import 'package:social_app/utils/app_size/app_size.dart';
import 'package:social_app/utils/service_locator/service_locator.dart';
import '../business_logic/cubit.dart';
import 'dots_effect.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnBoardingCubit, OnBoardingStates>(
      builder: (BuildContext context, OnBoardingStates state) {
        var cubit = OnBoardingCubit.get(context);
        return Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: cubit.pageController,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return const PageViewItem(
                    image: 'assets/images/social_cover.png',
                    title: 'Social App',
                    description: 'Welcome to our app',
                  );
                },
                onPageChanged: (value) {
                  cubit.changecurrentPageViewIndex(value);
                },
                itemCount: cubit.numberOfOnBoardingPages,
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.all(AppPadding.p14),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SmoothPageIndicator(
                    controller: cubit.pageController,
                    count: cubit.numberOfOnBoardingPages,
                    effect: dotsEffect(context),
                  ),
                  const Spacer(),
                  Visibility(
                    visible: cubit.currentPageViewIndex == 2,
                    replacement: const SizedBox(height: 30,width: 10,),
                    child: CustomTextButton(
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          Routes.loginRoute,
                          (_) => false,
                        );
                      },
                      buttonLabel: 'Get Started',
                      textColor: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class PageViewItem extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const PageViewItem({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.s14),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: AppSize.s14,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: AppSize.s12,
                  ),
                  child: Text(
                    description,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          height: 1.7,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
