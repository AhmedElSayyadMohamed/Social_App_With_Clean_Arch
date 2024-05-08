import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../utils/service_locator/service_locator.dart';
import '../bussiness_logic/feeds_bloc.dart';
import '../widgets/all_posts/all_posts.dart';
import '../widgets/friends_status/friends_status.dart';

class FeedsScreen extends StatelessWidget {
  final List<dynamic> followingUsersId;
  const FeedsScreen({super.key, required this.followingUsersId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FeedsBloc>(
      create: (context) => sl<FeedsBloc>()
        ..add(GetTimeLinePostsEvent(followingUsersId: followingUsersId)),
      child: RefreshIndicator(
        onRefresh: () async {
          sl<FeedsBloc>().add(GetTimeLinePostsEvent(followingUsersId: followingUsersId));
        },
        child: const SingleChildScrollView(
          child: Column(
            children: [
              FriendsStatus(),
              AllPosts(),
              SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
