import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/core/basics_shared_widgets/shimmer/shimmer.dart';
import 'package:social_app/feature/feeds/presentation/screens/feeds_screen.dart';
import 'package:social_app/feature/profile/presentation/business_logic/profile_bloc.dart';
import 'package:social_app/feature/profile/presentation/business_logic/profile_state.dart';
import 'package:social_app/utils/strings_manager/strings_manager.dart';
import '../../../../core/basics_shared_widgets/custom_text_button/custom_text_button.dart';
import '../../../undefine_route.dart';

List<String> screensTitles = [
  StringsManager.layoutTitle,
  'Search',
  'Notifications',
  'Settings'
];

Widget screens(int index) {
  switch (index) {
    case 0:
      return BlocBuilder<ProfileBloc, ProfileStates>(
          builder: (BuildContext context, state) {
        if (state is GetUserDataSuccessState) {
          return const FeedsScreen();
        } else {
          return const ShimmerLoadingScreen();
        }
      });
    case 1:
      return Container();
    case 2:
      return Column(
        children: [
          Container(
            color: Colors.redAccent,
            child: CustomTextButton(
              onTap: () async {
                await FirebaseAuth.instance.signOut();

              },
              buttonLabel: 'logout',
            ),
          )
        ],
      );
    case 3:
      return Container();
    default:
      return const UndefinedRouteScreen();
  }
}
