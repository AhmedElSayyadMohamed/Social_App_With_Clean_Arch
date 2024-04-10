import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/core/extension/responsive_context.dart';
import 'package:social_app/feature/profile/presentation/business_logic/profile_bloc.dart';
import 'package:social_app/feature/profile/presentation/business_logic/profile_state.dart';
import 'package:social_app/utils/app_padding/app_padding.dart';
import 'package:social_app/utils/app_size/app_size.dart';
import '../../../../core/basics_shared_widgets/custom_button/custom_button.dart';
import '../../../../core/basics_shared_widgets/shimmer/shimmer.dart';
import '../../../../core/icon_broken/icon_broken.dart';
import '../../../../utils/service_locator/service_locator.dart';
import '../../../../utils/strings_manager/strings_manager.dart';
import '../widget/my_posts_widget.dart';
import '../widget/profile_photo_and_cover.dart';
import '../widget/user_profile_info.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileBloc>(
      create: (BuildContext context) => sl<ProfileBloc>()
        ..add(GetUserDataEvent(FirebaseAuth.instance.currentUser!.uid)),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(5.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const ProfileImageWithCover(),//rebuild
                const UserProfileInformation(), //rebuild
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: OutlinedButton(
                        onPressed: () {},
                        child: Text(
                          "Add Image",
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: Theme.of(context).primaryColor,
                                  ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 1,
                      child: OutlinedButton(
                        onPressed: () {
                          // Navigation.navigatorTo(
                          //   context: context,
                          //   navigatorTo: EditeProfile(),
                          // );
                        },
                        child: const Icon(
                          IconBroken.Edit,
                          size: 25,
                        ),
                      ),
                    ),
                  ],
                ),
                const MyPosts(), // rebuild
              ],
            ),
          ),
        ),
      ),
    );
  }
}


