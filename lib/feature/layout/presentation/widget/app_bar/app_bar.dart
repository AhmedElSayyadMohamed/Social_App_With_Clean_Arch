import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/core/constants.dart';
import 'package:social_app/feature/profile/presentation/business_logic/profile_bloc.dart';
import 'package:social_app/feature/profile/presentation/business_logic/profile_state.dart';
import 'package:social_app/utils/app_padding/app_padding.dart';
import 'package:social_app/utils/app_size/app_size.dart';
import '../../../../../core/basics_shared_widgets/custom_cached_network_image/custom_cached_network_image.dart';
import '../../../../../core/icon_broken/icon_broken.dart';
import '../../../../../core/router/routing_name.dart';
import '../../../../../utils/service_locator/service_locator.dart';

class CustomLayoutAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;

  const CustomLayoutAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileBloc>.value(
      value: sl<ProfileBloc>()..add(GetUserDataEvent(currentUserId)),
      child: BlocBuilder<ProfileBloc, ProfileStates>(
        builder: (context, state) {
          switch (state) {
            case GetUserDataLoadingState _:
              return const SizedBox.shrink();
            case GetUserDataSuccessState _:
              return AppBar(
                elevation: 0,
                leading: IconButton(
                  padding: const EdgeInsetsDirectional.all(8),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: const Icon(
                    IconBroken.category,
                    size: AppSize.s3,
                  ),
                ),
                title: Text(title),
                centerTitle: true,
                actions: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.only(end: AppPadding.p16),
                    child: GestureDetector(
                      onTap: () => Navigator.pushNamed(
                          context, Routes.profileRoute,
                          arguments: state.user.uId),
                      child: CustomCachedNetworkImage(
                        imageUrl: state.user.photo,
                      ),
                    ),
                  ),
                ],
              );
            case GetUserDataErrorState _:
              return Text(state.msg);
            default:
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
