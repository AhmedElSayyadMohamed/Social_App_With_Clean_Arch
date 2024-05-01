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
        switch(state){
          case GetUserDataLoadingState _:return const SizedBox.shrink();
          case GetUserDataSuccessState _ : return Row(
            children: [
              CustomCachedNetworkImage(
                width: 40,
                height: 40,
                imageUrl:state.user.photo,
              ),
              SizedBox(
                width: context.widthPercent(2),
              ),
              Text(
                state.user.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme
                    .of(context)
                    .textTheme
                    .titleSmall,
              ),
            ],
          );
          case GetUserDataErrorState _ :return Text(state.msg) ;
          default:return const SizedBox.shrink();
        }

      },
    );
  }
}
