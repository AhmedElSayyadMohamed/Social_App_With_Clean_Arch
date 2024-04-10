import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/core/extension/responsive_context.dart';
import 'package:social_app/feature/profile/presentation/business_logic/profile_bloc.dart';
import 'package:social_app/feature/profile/presentation/business_logic/profile_state.dart';
import '../../../../core/basics_shared_widgets/custom_cached_network_image/custom_cached_network_image.dart';
import '../../../../utils/app_size/app_size.dart';

class ProfileImageWithCover extends StatelessWidget {
  const ProfileImageWithCover({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileStates>(
      builder: (BuildContext context, state) {
        switch (state) {
          case GetUserDataLoadingState():
            return const SizedBox(
              height: 270,
              child: CircularProgressIndicator(),
            );
          case GetUserDataSuccessState():
            {
              return Column(
                children: [
                  SizedBox(
                    height: 230,
                    child: Stack(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 180,
                          child: CustomCachedNetworkImage(
                            imageUrl: state.user.profileCover,
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional.bottomCenter,
                          child: GestureDetector(
                            onTap: () {},
                            child: CircleAvatar(
                              radius: 60,
                              backgroundImage:
                                  CachedNetworkImageProvider(state.user.photo),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: AppSize.s05,
                  ),
                  SizedBox(
                    width: context.widthPercent(AppSize.s8),
                    child: Center(
                      child: Text(
                        state.user.name,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: AppSize.s05,
                  ),
                  SizedBox(
                    width: context.widthPercent(AppSize.s7),
                    child: Center(
                      child: Text(
                        state.user.bio,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ),
                  ),
                ],
              );
            }
          case GetUserDataErrorState():
            return Center(
                child: Text(state.msg),
            );
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}
