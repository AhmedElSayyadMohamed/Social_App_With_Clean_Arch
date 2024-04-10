import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/feature/layout/presentation/bussiness_logic/social_bloc.dart';
import 'package:social_app/feature/layout/presentation/widget/constants.dart';
import '../../../../utils/service_locator/service_locator.dart';
import '../widget/app_bar/app_bar.dart';
import '../widget/bottom_nav_bar/bottom_nav_bar.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SocialBloc>(
      create: (BuildContext context) => sl<SocialBloc>(),
      child: BlocBuilder<SocialBloc, SocialStates>(
        builder: (context, state) {
          var bloc = SocialBloc.get(context);
          return Scaffold(
            appBar: CustomLayoutAppBar(
              title: screensTitles[bloc.navBarIndex],
            ),
            body: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                screens[bloc.navBarIndex],
                const CustomBottomNavBar(),
              ],
            ),
          );
        },
      ),
    );
  }
}
