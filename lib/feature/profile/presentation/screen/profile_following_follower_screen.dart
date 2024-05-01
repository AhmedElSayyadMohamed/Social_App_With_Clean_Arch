import 'package:flutter/material.dart';
import 'package:social_app/feature/profile/presentation/widget/my_posts_widget.dart';
import 'package:social_app/utils/app_padding/app_padding.dart';

import '../widget/profile_photo_and_cover.dart';
import '../widget/user_profile_info.dart';

class FollowUserScreen extends StatelessWidget {
  final String uId;

  const FollowUserScreen({super.key, required this.uId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p4),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileImageWithCover(uId:uId),
                UserProfileInformation(uId: uId,),
                MyPosts(uId: uId),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
