import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../../core/basics_shared_widgets/custom_text_button/custom_text_button.dart';
import '../widgets/all_posts/all_posts.dart';
import '../widgets/friends_status/friends_status.dart';


class FeedsScreen extends StatelessWidget {
  const FeedsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const FriendsStatus(),
          Container(
            color: Colors.redAccent,
            child: CustomTextButton(
              onTap: () async {
                await FirebaseAuth.instance.signOut();
              },
              buttonLabel: 'logout',
            ),
          ),
          const AllPosts(),
        ],
      ),
    );
  }
}
