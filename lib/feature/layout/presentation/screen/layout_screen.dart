import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/core/basics_shared_widgets/flutter_toast/flutter_toast.dart';
import 'package:social_app/feature/auth/domain/entities/user.dart';
import 'package:social_app/feature/layout/presentation/bussiness_logic/social_bloc.dart';
import 'package:social_app/feature/layout/presentation/widget/friends_status/friends_status.dart';
import '../../../../utils/service_locator/service_locator.dart';
import '../widget/all_posts/all_posts.dart';
import '../widget/app_bar/app_bar.dart';
import '../widget/bottom_nav_bar/bottom_nav_bar.dart';

class LayoutScreen extends StatelessWidget {
  final UserEntity user;
  const LayoutScreen({super.key, required this.user});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomLayoutAppBar(userPhoto: user.photo),
      body: BlocProvider<SocialBloc>(
        create: (BuildContext context) => sl<SocialBloc>(),
        child: BlocListener<SocialBloc, SocialStates>(
          listener: (BuildContext context, SocialStates state) {
            // Alarm.flutterToast(
            //     massage: 'Welcome back ${user.name}',
            //     toastState: ToastState.success);
          },
          child: const Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    FriendsStatus(),
                    AllPosts(),
                  ],
                ),
              ),
              CustomBottomNavBar(),
            ],
          ),
        ),
      ),
    );
  }
}
