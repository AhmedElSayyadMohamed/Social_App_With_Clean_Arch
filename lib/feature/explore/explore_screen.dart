import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/feature/profile/presentation/business_logic/profile_bloc.dart';
import 'package:social_app/feature/profile/presentation/business_logic/profile_state.dart';
import 'package:social_app/utils/service_locator/service_locator.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sl<ProfileBloc>(),
      child: BlocBuilder<ProfileBloc, ProfileStates>(
        builder: (context, state) {
          return ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) => Container(
              height: 100,
              width: double.infinity,
              color: Colors.green,
            ),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: 10,
          );
        },
      ),
    );
  }
}
