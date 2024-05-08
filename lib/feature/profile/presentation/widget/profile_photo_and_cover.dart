import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/core/extension/responsive_context.dart';
import 'package:social_app/core/icon_broken/icon_broken.dart';
import 'package:social_app/core/router/routing_name.dart';
import 'package:social_app/feature/profile/presentation/business_logic/profile_bloc.dart';
import 'package:social_app/feature/profile/presentation/business_logic/profile_state.dart';
import 'package:social_app/feature/profile/presentation/widget/profile_image/profile_image.dart';
import 'package:social_app/utils/app_padding/app_padding.dart';
import '../../../../core/basics_shared_widgets/custom_cached_network_image/custom_cached_network_image.dart';
import '../../../../core/basics_shared_widgets/shimmer/shimmer.dart';
import '../../../../core/constants.dart';
import '../../../../utils/app_size/app_size.dart';

class ProfileImageWithCover extends StatelessWidget {
  final String uId;
  const ProfileImageWithCover({super.key, required this.uId});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<ProfileBloc, ProfileStates>(builder: (context, state) {
      switch (state) {
        case GetUserDataSuccessState
          _:
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 210,
                child: Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 160,
                      child: CustomCachedNetworkImage(
                        borderRadius: 0,
                        imageUrl: state.user.profileCover,
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional.bottomStart,
                      child: ProfilePhoto(
                        profilePhoto: state.user.photo,
                        uId: uId,
                      ),
                    ),
                    if (uId == currentUserId)
                      PositionedDirectional(
                        top: 0,
                        end: 0,
                        child: GestureDetector(
                          onTap: () {},
                          child: CircleAvatar(
                            backgroundColor: Colors.grey[200],
                            radius: 15,
                            child: const Icon(
                              IconBroken.camera,
                              size: 25,
                            ),
                          ),
                        ),
                      )
                  ],
                ),
              ),
              const SizedBox(
                height: AppSize.s05,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.symmetric(
                  horizontal: AppPadding.p16,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.user.name,
                            style: Theme
                                .of(context)
                                .textTheme
                                .titleMedium,
                            maxLines: 1,
                          ),
                          SizedBox(
                            height: context.heightPercent(0.05),
                          ),
                          Text(
                            state.user.bio,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme
                                .of(context)
                                .textTheme
                                .bodySmall,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: context.widthPercent(0.05),
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              Routes.followingScreen,
                              arguments: state.user.following,
                            );
                          },
                          child: Column(
                            children: [
                              Text(
                                state.user.following.length.toString(),
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .bodyLarge,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Following",
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .bodyLarge,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        InkWell(
                          onTap: () =>
                              Navigator.pushNamed(
                                context,
                                Routes.followersScreen,
                                arguments: state.user.followers,
                              ),
                          child: Column(
                            children: [
                              Text(
                                state.user.followers.length.toString(),
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .bodyLarge,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Followers",
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .bodyLarge,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        case GetUserDataErrorState
          _:
          return Text(state.msg);
      }
      return const ShimmerLoadingScreen();
    }
    );
  }
}
