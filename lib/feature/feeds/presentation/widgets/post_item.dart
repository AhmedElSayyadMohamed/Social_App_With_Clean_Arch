import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:social_app/core/basics_shared_widgets/custom_cached_network_image/custom_cached_network_image.dart';
import 'package:social_app/core/extension/responsive_context.dart';
import 'package:social_app/utils/app_padding/app_padding.dart';
import '../../../../core/icon_broken/icon_broken.dart';
import '../../../../utils/app_size/app_size.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(),
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p12),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 25,
                  child: CustomCachedNetworkImage(imageUrl: '',),
                ),
                SizedBox(
                  width: context.widthPercent(AppSize.s03),
                ),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: AppPadding.p4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                'Ahmed El_Sayyad Mohamed ali ',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ),
                            SizedBox(width: context.widthPercent(2)),
                            const Icon(
                              Icons.check_circle,
                              size: AppSize.s2,
                              color: Colors.blueAccent,
                            ),
                          ],
                        ),
                        Text(
                          'model.postDa',
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.more_horiz,
                      size: 25,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(AppPadding.p12),
              child: Text(
                'model.containingOfPost.toString()...................'
                    '................................................'
                    '...............................................',
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      const Icon(
                        IconBroken.Heart,
                        color: Colors.red,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "15",
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        IconBroken.Chat,
                        size: 24,
                        color: Colors.amber,
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Text(
                        '10',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(
              thickness: 1,
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 17,
                          child: CachedNetworkImage(
                            imageUrl: '',
                            fit: BoxFit.cover,
                            placeholder: (context, url) =>
                                Image.asset("assets/images/loading.gif"),
                            errorWidget: (context, url, error) =>
                            const Icon(Icons.error,size: 16,),
                          ),
                        ),
                        SizedBox(
                          width: context.widthPercent(AppSize.s03),
                        ),
                        Text(
                          "write a comment......",
                          style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.grey[500]),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Icon(
                          IconBroken.Heart,
                          color: Colors.red,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "like",
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
