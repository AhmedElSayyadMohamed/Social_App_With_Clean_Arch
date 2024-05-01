import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/core/basics_shared_widgets/shimmer/shimmer.dart';
import 'package:social_app/feature/feeds/presentation/widgets/post_widget.dart';
import '../../bussiness_logic/feeds_bloc.dart';

class AllPosts extends StatelessWidget {
  const AllPosts({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeedsBloc, FeedsStates>(
      builder: (context, state) {
        switch (state) {
          case GetTimeLinePostsLoadingState _:
            return const ShimmerLoadingScreen();
          case GetTimeLinePostsSuccessState _:
            return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) =>
                  PostWidget(post: state.posts[index]),
              itemCount: state.posts.length,
            );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
