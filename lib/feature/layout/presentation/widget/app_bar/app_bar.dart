import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/feature/profile/presentation/business_logic/profile_bloc.dart';
import 'package:social_app/feature/profile/presentation/business_logic/profile_state.dart';
import 'package:social_app/utils/app_padding/app_padding.dart';
import 'package:social_app/utils/app_size/app_size.dart';
import '../../../../../core/basics_shared_widgets/custom_cached_network_image/custom_cached_network_image.dart';
import '../../../../../core/icon_broken/icon_broken.dart';
import '../../../../../core/router/routing_name.dart';

class CustomLayoutAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;

  const CustomLayoutAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileStates>(
      builder: (context, state) {
        return AppBar(
          elevation: 0,
          leading: IconButton(
            padding: const EdgeInsetsDirectional.all(8),
            onPressed: () {},
            icon: const Icon(
              IconBroken.category,
              size: AppSize.s3,
            ),
          ),
          title: Text(title),
          centerTitle: true,
          actions: [
            state is GetUserDataSuccessState?
            Padding(
              padding: const EdgeInsetsDirectional.only(end: AppPadding.p16),
              child: GestureDetector(
                onTap: () => Navigator.pushNamed(context, Routes.profileRoute,arguments:state.user ),
                child: CustomCachedNetworkImage(imageUrl: state.user.photo,),
              ),
            ):const SizedBox(),
          ],
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
