import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/core/extension/responsive_context.dart';
import '../../../../../../core/basics_shared_widgets/custom_cached_network_image/custom_cached_network_image.dart';
import '../../../../../profile/presentation/business_logic/profile_bloc.dart';
import '../../../../../profile/presentation/business_logic/profile_state.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileStates>(
      builder: (context, state) {
        var bloc = ProfileBloc.get(context);
        return Row(
          children: [
             CustomCachedNetworkImage(
              radius: 40,
              imageUrl:bloc.user.photo,
            ),
            SizedBox(
              width: context.widthPercent(2),
            ),
            Text(
              bloc.user.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme
                  .of(context)
                  .textTheme
                  .titleSmall,
            ),
          ],
        );
      },
    );
  }
}
