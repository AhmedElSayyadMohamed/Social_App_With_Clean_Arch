import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/core/extension/responsive_context.dart';
import 'package:social_app/feature/feeds/domain/entities/post.dart';
import 'package:social_app/feature/feeds/presentation/widgets/post_interaction_row/post_interaction_row_widget.dart';
import 'package:social_app/feature/profile/presentation/business_logic/profile_bloc.dart';
import 'package:social_app/feature/profile/presentation/business_logic/profile_state.dart';
import 'package:social_app/utils/app_padding/app_padding.dart';
import '../../../../core/basic_shared_func/basic_shared_func.dart';
import '../../../../core/basics_shared_widgets/custom_cached_network_image/custom_cached_network_image.dart';
import '../../../../utils/app_size/app_size.dart';
import '../../../../utils/service_locator/service_locator.dart';

class PostWidget extends StatelessWidget {
  final Post post;
  const PostWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: const RoundedRectangleBorder(),
      child:Padding(
      padding: const EdgeInsetsDirectional.all(5),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(AppPadding.p8),
            child: BlocProvider.value(
              value: sl<ProfileBloc>()..add(GetUserDataEvent(post.uId)),
              child: BlocBuilder<ProfileBloc, ProfileStates>(
                builder: (context, state) {
                  switch (state) {
                    case GetUserDataLoadingState _:
                      return const SizedBox.shrink();
                    case GetUserDataSuccessState _:
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomCachedNetworkImage(
                            width: 45,
                            height: 45,
                            imageUrl: state.user.photo,
                          ),
                          SizedBox(
                            width: context.widthPercent(AppSize.s03),
                          ),
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: AppPadding.p4,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Flexible(
                                        child: Text(
                                          state.user.name,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall,
                                        ),
                                      ),
                                      SizedBox(
                                        width: context.widthPercent(2),
                                      ),
                                      const Icon(
                                        Icons.check_circle,
                                        size: AppSize.s2,
                                        color: Colors.blueAccent,
                                      ),
                                      SizedBox(
                                        width: context.widthPercent(2),
                                      ),
                                      Text(
                                        dateFormattingAndDifferenceFromNow(
                                            post.date),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {},
                            child: const Icon(
                              Icons.more_horiz,
                              size: 25,
                            ),
                          ),
                        ],
                      );
                    case GetUserDataErrorState _:
                      return SizedBox(
                        child: Text(state.msg),
                      );
                    default:
                      return const SizedBox.shrink();
                  }
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal:AppPadding.p8,),
            child: Text(
              post.containText,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          CustomCachedNetworkImage(
            borderRadius: 2,
            width: double.infinity,
            height: 300,
            imageUrl: post.image,
          ),
          const SizedBox(
            height: 7,
          ),
          Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: Text(
              'Created at ${dateFormatting(post.date)}',
              style:
                  Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 10),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          PostInteractionRow(
            post: post,
            onLikePressed: () {},
            onCommentPressed: () {},
            onSharePressed: () {},
          ),
        ],
      ),
      ),
    );
  }
}

/*
* Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BuildInteractionButton(
          onPressed: onLikePressed,
          icon:IconBroken.Heart,
          label: post.likes.length.toString(),
        ),
        BuildInteractionButton(
          onPressed: onCommentPressed,
          icon: IconBroken.Chat,
          label: post.comments.length.toString(),
        ),
        BuildInteractionButton(
          onPressed:onSharePressed,
          icon:IconBroken.Send,
          label: '0',
        ),
      ],
    )*/
