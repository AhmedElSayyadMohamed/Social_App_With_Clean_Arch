import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/feature/feeds/presentation/bussiness_logic/feeds_bloc.dart';
import '../../../../utils/app_padding/app_padding.dart';
import '../../../../utils/service_locator/service_locator.dart';
import '../widgets/create_post_widget/app_bar/app_bar.dart';
import '../widgets/create_post_widget/create_post_body/create_post_body.dart';
import '../widgets/create_post_widget/pick_image_or_add_tags_bar/pick_image_and_add_tages.dart';
import '../widgets/create_post_widget/user_profile_bar/profile_photo_and_user_name.dart';

class CreatePostScreen extends StatelessWidget {
  const CreatePostScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sl<FeedsBloc>(),
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: Padding(
          padding: const EdgeInsetsDirectional.all(AppPadding.p16),
          child: Column(
            children: [
              const UserProfile(),
              CreatePostScreenBody(),
              const PickImageAndAddTags(),
            ],
          ),
        ),
      ),
    );
  }
}
