import 'package:flutter/material.dart';
import 'package:social_app/feature/profile/domain/entities/user.dart';
import '../widget/my_posts_widget.dart';
import '../widget/profile_photo_and_cover.dart';
import '../widget/user_profile_info.dart';

class ProfileScreen extends StatelessWidget {
  final UserEntity user;
  const ProfileScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileImageWithCover(user: user,),
                const UserProfileInformation(), //r

                MyPosts(uId: user.uId,), // rebuild
              ],
            ),
          ),
        ),
      ),
    );
   
  }
}


