import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/core/basics_shared_widgets/custom_cached_network_image/custom_cached_network_image.dart';
import 'package:social_app/core/router/routing_name.dart';
import 'package:social_app/feature/profile/presentation/business_logic/profile_bloc.dart';
import 'package:social_app/feature/profile/presentation/business_logic/profile_state.dart';
import 'package:social_app/utils/app_padding/app_padding.dart';
import '../../../../utils/service_locator/service_locator.dart';

class FollowingScreen extends StatelessWidget {
  final List following;
  const FollowingScreen({
    super.key,
    required this.following,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Following'),
      ),
      body: BlocProvider.value(
        value: sl<ProfileBloc>()..add(GetFollowingDataEvent(following)),
        child: Padding(
          padding: const EdgeInsetsDirectional.all(AppPadding.p8),
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return BlocBuilder<ProfileBloc, ProfileStates>(
                builder: (context, state) {
                  switch (state) {
                    case GetFollowingDataLoadingState _:
                    return const SizedBox(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                    case GetFollowingDataSuccessState _:
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.profileRoute,
                            arguments: state.following[index]);
                      },
                      child: ListTile(
                        contentPadding:
                        const EdgeInsetsDirectional.all(AppPadding.p8),
                        leading: CustomCachedNetworkImage(
                          imageUrl: state.following[index].photo,
                        ),
                        title: Text(state.following[index].name),
                        subtitle: Text(state.following[index].bio),
                      ),
                    );
                    case GetFollowingDataErrorState _:
                    return Text(state.msg);
                    default:
                      return const SizedBox.shrink();
                  }
                },
              );
            },
            itemCount: following.length,
          ),
        ),
      ),
    );
  }
}
