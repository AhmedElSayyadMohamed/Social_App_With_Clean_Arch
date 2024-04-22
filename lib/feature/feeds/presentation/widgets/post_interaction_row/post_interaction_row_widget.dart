import 'package:flutter/material.dart';

import '../../../../../core/icon_broken/icon_broken.dart';
import '../../../domain/entities/post.dart';
import '../post_interaction_button/post_interaction_button_widget.dart';

class PostInteractionRow extends StatelessWidget {
  final Post post;
  final VoidCallback onLikePressed;
  final VoidCallback onCommentPressed;
  final VoidCallback onSharePressed;
  const PostInteractionRow({
    super.key,
    required this.post,
    required this.onLikePressed,
    required this.onCommentPressed,
    required this.onSharePressed,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.all(3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BuildInteractionButton(
            onPressed: onLikePressed,
            icon: IconBroken.heart,
            label: post.likes.length.toString(),
          ),
          BuildInteractionButton(
            onPressed: onCommentPressed,
            icon: IconBroken.chat,
            label: post.comments.length.toString(),
          ),
          BuildInteractionButton(
            onPressed: onSharePressed,
            icon: IconBroken.send,
            label: '0',
          ),
        ],
      ),
    );
  }
}
