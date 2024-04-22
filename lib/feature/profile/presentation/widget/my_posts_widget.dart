import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/core/constants.dart';
import 'package:social_app/feature/feeds/presentation/bussiness_logic/feeds_bloc.dart';
import 'package:social_app/feature/feeds/presentation/widgets/post_widget.dart';
import '../../../../core/basics_shared_widgets/shimmer/shimmer.dart';
import '../../../../utils/service_locator/service_locator.dart';

class MyPosts extends StatelessWidget {
  const MyPosts({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sl<FeedsBloc>()..add(GetMyPostsByIdEvent(currentUserId)),
      child: BlocBuilder<FeedsBloc, FeedsStates>(
        buildWhen: (prev,current)=>FeedsStates != GetMyPostsByUidSuccessState,
        builder: (BuildContext context, state) {
          switch (state) {
            case GetMyPostsByUidLoadingState _:
              return const ShimmerLoadingScreen();
            case GetMyPostsByUidSuccessState _:
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => PostWidget(post: state.posts[index],),
                  itemCount: state.posts.length,
                ),
              );
            case GetMyPostsByUidErrorState _:
              return SizedBox(
                child: Text(state.msg),
              );
            default:
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
