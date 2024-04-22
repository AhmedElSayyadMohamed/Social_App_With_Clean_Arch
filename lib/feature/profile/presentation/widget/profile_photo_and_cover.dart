import 'package:flutter/material.dart';
import 'package:social_app/core/router/routing_name.dart';
import 'package:social_app/feature/profile/domain/entities/user.dart';
import 'package:social_app/feature/profile/presentation/widget/profile_image/profile_image.dart';
import 'package:social_app/utils/app_padding/app_padding.dart';
import '../../../../core/basics_shared_widgets/custom_cached_network_image/custom_cached_network_image.dart';
import '../../../../utils/app_size/app_size.dart';

class ProfileImageWithCover extends StatelessWidget {
  final UserEntity user;
  const ProfileImageWithCover({super.key, required this.user});
  //
  // get _onTapProfilePic => null;
  //
  // get _onTapToPickAnewProfilePic => null;

  @override
  Widget build(BuildContext context) {
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
                  imageUrl: user.profileCover,
                ),
              ),
              Align(
                alignment: AlignmentDirectional.bottomStart,
                child: ProfilePhoto(profilePhoto: user.photo),
              )
            ],
          ),
        ),
        const SizedBox(
          height: AppSize.s05,
        ),
        Padding(
          padding: const EdgeInsetsDirectional.symmetric(
            horizontal: AppPadding.p24,
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.name,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(
                      height: AppSize.s05,
                    ),
                    Text(
                      user.bio,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Column(
                      children: [
                        Text(
                          user.following.length.toString(),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Following",
                          style: Theme.of(context).textTheme.bodyMedium,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                          context, Routes.followersScreen,
                          arguments: user.followers,
                      );
                    },
                    child: Column(
                      children: [
                        Text(
                          user.followers.length.toString(),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Followers",
                          style: Theme.of(context).textTheme.bodyMedium,
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
  }
}
