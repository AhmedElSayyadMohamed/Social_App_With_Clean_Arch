import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:social_app/core/extension/responsive_context.dart';
import 'package:social_app/feature/profile/presentation/business_logic/profile_bloc.dart';
import 'package:social_app/feature/profile/presentation/business_logic/profile_state.dart';
import 'package:social_app/feature/profile/presentation/widget/my_posts_widget.dart';
import 'package:social_app/utils/app_padding/app_padding.dart';

import '../../../../core/basics_shared_widgets/custom_button/custom_button.dart';
import '../../../../utils/service_locator/service_locator.dart';
import '../../../../utils/strings_manager/strings_manager.dart';
import '../widget/profile_photo_and_cover.dart';

class FollowUserScreen extends StatelessWidget {
  final String uId;

  const FollowUserScreen({super.key, required this.uId});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: BlocProvider<ProfileBloc>.value(
        value: sl<ProfileBloc>()..add(GetUserDataEvent(uId)),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p4),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileImageWithCover(uId: uId),
                  InteractionFollowerButtonsBar(uId: uId),
                  MyPosts(uId: uId),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class InteractionFollowerButtonsBar extends StatelessWidget {
  final String uId;

  const InteractionFollowerButtonsBar({super.key, required this.uId});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.all(8),
      child: Row(
        children: [
          Expanded(
            child: FollowButton(
              uId: uId,
            ),
          ),
          SizedBox(
            width: context.widthPercent(1.5),
          ),
          CustomButton(
            onTap: () {},
            borderRadius: AppPadding.p4,
            buttonLabel: StringsManager.messageFriend,
          ),
        ],
      ),
    );
  }
}

class FollowButton extends StatelessWidget {
  final String uId;
  // String label = 'follow';

  const FollowButton({
    super.key,
    required this.uId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileStates>(
      builder: (BuildContext context, state) {
        var bloc = ProfileBloc.get(context);
        if (state is GetUserDataLoadingState) {
          return const Center(
            child:CircularProgressIndicator(),
          );
        } else if (state is GetUserDataSuccessState) {
          return CustomButton(
            onTap: () {
              sl<ProfileBloc>().add(ToggleFollowingUserEvent(
                followingUserId: uId,
              ));
              sl<ProfileBloc>().add(GetUserDataEvent(uId));
            },
            borderRadius: AppPadding.p4,
            buttonLabel:bloc.toggleFollowingButton(user:state.user),
          );
        } else {
          return CustomButton(
            onTap: () {
              sl<ProfileBloc>().add(ToggleFollowingUserEvent(
                followingUserId: uId,
              ));
              sl<ProfileBloc>().add(GetUserDataEvent(uId));
            },
            borderRadius: AppPadding.p4,
            buttonLabel: StringsManager.follow,
          );
        }
      },
    );
  }
}
