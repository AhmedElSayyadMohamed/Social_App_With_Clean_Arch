import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/icon_broken/icon_broken.dart';
import '../../../../../utils/service_locator/service_locator.dart';
import '../../../domain/entities/post.dart';
import '../../bussiness_logic/feeds_bloc.dart';
import '../post_interaction_button/post_interaction_button_widget.dart';

class PostInteractionRow extends StatelessWidget {
  final Post post;

  const PostInteractionRow({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.all(3),
      child: BlocProvider.value(
        value: sl<FeedsBloc>(),
        child: BlocBuilder<FeedsBloc, FeedsStates>(
          builder: (context, state) {
            var bloc = FeedsBloc.get(context);
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BuildInteractionButton(
                  onPressed: () => bloc.add(LikePostEvent(
                        post: post,
                      )),
                  icon: IconBroken.heart,
                  label: post.likesCounts.toString(),
                ),
                BuildInteractionButton(
                  onPressed: () {},
                  icon: IconBroken.chat,
                  label: post.commentsCounts.toString(),
                ),
                BuildInteractionButton(
                  onPressed: () {},
                  icon: IconBroken.send,
                  label: '0',
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
