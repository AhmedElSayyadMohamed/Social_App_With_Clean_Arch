import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/core/basics_shared_widgets/custom_cached_network_image/custom_cached_network_image.dart';
import 'package:social_app/core/router/routing_name.dart';
import 'package:social_app/feature/profile/presentation/business_logic/profile_bloc.dart';
import 'package:social_app/feature/profile/presentation/business_logic/profile_state.dart';
import 'package:social_app/utils/app_padding/app_padding.dart';

import '../../../../utils/service_locator/service_locator.dart';

class FollowersScreen extends StatelessWidget {
  final List followers;
  const FollowersScreen({
    super.key,
    required this.followers,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Followers'),
      ),
      body: BlocProvider.value(
        value: sl<ProfileBloc>()..add(GetFollowersDataEvent(followers)),
        child: Padding(
          padding: const EdgeInsetsDirectional.all(AppPadding.p8),
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return BlocBuilder<ProfileBloc, ProfileStates>(
                builder: (context, state) {
                  switch (state) {
                    case GetFollowersDataLoadingState _:
                      return const SizedBox(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    case GetFollowersDataSuccessState _:
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            Routes.followUserScreen,
                              arguments: followers[index],
                          );
                        },
                        child: ListTile(
                          contentPadding:
                              const EdgeInsetsDirectional.all(AppPadding.p8),
                          leading: CustomCachedNetworkImage(
                            imageUrl: state.followers[index].photo,
                          ),
                          title: Text(state.followers[index].name),
                          subtitle: Text(state.followers[index].bio),
                        ),
                      );
                    case GetFollowersDataErrorState _:
                      return Text(state.msg);
                    default:
                      return const SizedBox.shrink();
                  }
                },
              );
            },
            itemCount: followers.length,
          ),
        ),
      ),
    );
  }
}
