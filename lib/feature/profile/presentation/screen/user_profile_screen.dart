import 'package:flutter/material.dart';
import '../widget/my_posts_widget.dart';
import '../widget/profile_photo_and_cover.dart';
import '../widget/user_profile_info.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                ProfileImageWithCover(),//rebuild
                UserProfileInformation(), //rebuild
                MyPosts(), // rebuild
              ],
            ),
          ),
        ),
      ),
    );
   
  }
}


