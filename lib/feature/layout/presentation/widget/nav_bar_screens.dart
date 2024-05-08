import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/feature/explore/explore_screen.dart';
import 'package:social_app/feature/layout/presentation/business_logic/social_bloc.dart';
import 'package:social_app/feature/layout/presentation/widget/setting_screen.dart';
import '../../../feeds/presentation/screens/feeds_screen.dart';
import '../../../undefine_route.dart';

class NavBarButtonsScreens extends StatelessWidget {
  final List<dynamic> followingUsersId;

  const NavBarButtonsScreens({super.key, required this.followingUsersId,});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SocialBloc, SocialStates>(
      builder: (context, state) {

        switch (SocialBloc.get(context).navBarIndex) {
          case 0:
            return FeedsScreen(followingUsersId:followingUsersId,);
          case 1:
            return Container();
          case 2:
            return const ExploreScreen();
          case 3:
            return const SettingScreen();
          default:
            return const UndefinedRouteScreen();
        }
      },
    );


     }
}
