import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/core/basics_shared_widgets/shimmer/shimmer.dart';

import '../../../../core/constants.dart';
import '../../../../utils/service_locator/service_locator.dart';
import '../../../profile/presentation/business_logic/profile_bloc.dart';
import '../../../profile/presentation/business_logic/profile_state.dart';
import 'nav_bar_screens.dart';

class LayoutBody extends StatelessWidget {

  const LayoutBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sl<ProfileBloc>()..add(GetUserDataEvent(currentUserId)),
      child: BlocBuilder<ProfileBloc, ProfileStates>(
        builder: (context, state) {
          if (state is GetUserDataErrorState) {
            return Text(state.msg);
          } else if (state is GetUserDataSuccessState) {
            return NavBarButtonsScreens(
              followingUsersId: state.user.following,
            );
          } else {
            return const ShimmerLoadingScreen();
          }
        },
      ),
    );
  }
}
