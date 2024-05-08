import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/core/basics_shared_widgets/custom_text_button/custom_text_button.dart';
import 'package:social_app/core/router/routing_name.dart';
import 'package:social_app/utils/service_locator/service_locator.dart';
import '../business_logic/cubit.dart';
import '../widgets/onboarding_pageview.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OnBoardingCubit>(
      create: (BuildContext context) => sl<OnBoardingCubit>(),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomTextButton(
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    Routes.loginRoute,
                    (_) => false,
                  );
                },
                buttonLabel: 'skip',
                textColor: Theme.of(context).primaryColor,
              ),
              const Expanded(
                child: OnBoardingPageView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
