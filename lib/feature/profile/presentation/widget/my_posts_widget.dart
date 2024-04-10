import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/basics_shared_widgets/shimmer/shimmer.dart';
import '../business_logic/profile_bloc.dart';
import '../business_logic/profile_state.dart';

class MyPosts extends StatelessWidget {
  const MyPosts({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileStates>(
      builder: (BuildContext context, state) {
        int num = 2;
        switch (num) {
          case 1:
            return const ShimmerLoadingScreen();
          case 2:
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => Container(
                  height: 100,
                  color: Colors.indigo,
                ),
                itemCount: 8,
              ),
            );
          case 3:
            return const SizedBox.shrink();
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}
