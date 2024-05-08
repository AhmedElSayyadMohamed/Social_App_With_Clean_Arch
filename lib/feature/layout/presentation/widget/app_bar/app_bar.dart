import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/core/constants.dart';
import 'package:social_app/feature/layout/presentation/business_logic/social_bloc.dart';
import 'package:social_app/feature/profile/presentation/business_logic/profile_bloc.dart';
import 'package:social_app/feature/profile/presentation/business_logic/profile_state.dart';
import '../../../../../core/basics_shared_widgets/custom_cached_network_image/custom_cached_network_image.dart';
import '../../../../../core/icon_broken/icon_broken.dart';
import '../../../../../core/router/routing_name.dart';
import '../../../../../utils/service_locator/service_locator.dart';
import '../../../../../utils/strings_manager/strings_manager.dart';

class CustomLayoutAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  CustomLayoutAppBar({super.key});

  final List<String> screensTitles = [
    StringsManager.layoutTitle,
    'Chat',
    'Notifications',
    'Settings'
  ];
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: BlocBuilder<SocialBloc, SocialStates>(
        builder: (context, state) {
          return Text(screensTitles[sl<SocialBloc>().navBarIndex]);
        },
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            IconBroken.search,
            size: 25,
          ),
        ),
        BlocProvider<ProfileBloc>.value(
          value: sl<ProfileBloc>()..add(GetUserDataEvent(currentUserId)),
          child: BlocBuilder<ProfileBloc, ProfileStates>(
            builder: (context, state) {
              if (state is GetUserDataSuccessState) {
                return Padding(
                  padding:
                      const EdgeInsetsDirectional.symmetric(horizontal: 10),
                  child: GestureDetector(
                    onTap: () => Navigator.pushNamed(
                      context,
                      Routes.profileRoute,
                    ),
                    child: CustomCachedNetworkImage(
                      imageUrl: state.user.photo,
                    ),
                  ),
                );
              } else {
                return const Padding(
                  padding: EdgeInsetsDirectional.symmetric(horizontal: 10),
                  child: CircleAvatar(),
                );
              }
            },
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
