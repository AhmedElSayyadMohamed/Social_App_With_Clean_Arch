import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/core/constants.dart';
import 'package:social_app/feature/feeds/presentation/bussiness_logic/feeds_bloc.dart';
import '../../../../utils/service_locator/service_locator.dart';
import '../../../profile/presentation/business_logic/profile_bloc.dart';
import '../../../profile/presentation/business_logic/profile_state.dart';
import '../widgets/all_posts/all_posts.dart';
import '../widgets/friends_status/friends_status.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileBloc>.value(
      value: sl<ProfileBloc>()..add(GetUserDataEvent(currentUserId)),
      child: BlocBuilder<ProfileBloc, ProfileStates>(
        builder: (context, profileState) {
          if (profileState is GetUserDataSuccessState) {
            return BlocProvider<FeedsBloc>(
              create: (context) => sl<FeedsBloc>()
                ..add(
                  GetTimeLinePostsEvent(
                    followingUsersId: profileState.user.following??[],
                  ),
                ),
              child: RefreshIndicator(
                onRefresh: () async {
                  FeedsBloc.get(context).add(
                    GetTimeLinePostsEvent(
                      followingUsersId: profileState.user.following,
                    ),
                  );
                },
                child: const SingleChildScrollView(
                  child: Column(
                    children: [
                      FriendsStatus(),
                      AllPosts(),
                      SizedBox(
                        height: 100,
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Text('data');
          }
        },
      ),
    );
  }
}
