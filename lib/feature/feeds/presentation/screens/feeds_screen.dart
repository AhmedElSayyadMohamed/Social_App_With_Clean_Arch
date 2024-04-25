import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/feature/feeds/presentation/bussiness_logic/feeds_bloc.dart';
import 'package:social_app/feature/profile/presentation/business_logic/profile_bloc.dart';
import '../../../../utils/service_locator/service_locator.dart';
import '../widgets/all_posts/all_posts.dart';
import '../widgets/friends_status/friends_status.dart';


class FeedsScreen extends StatelessWidget {
  const FeedsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var currentUser = ProfileBloc.get(context);
    return BlocProvider(
      create: (BuildContext context)=>sl<FeedsBloc>()
        ..add(GetTimeLinePostsEvent(followingUsersId: currentUser.user.following)),
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
    );
  }
}
