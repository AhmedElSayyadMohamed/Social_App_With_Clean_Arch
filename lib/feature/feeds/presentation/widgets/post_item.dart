import 'package:flutter/material.dart';
import 'package:social_app/core/extension/responsive_context.dart';
import 'package:social_app/utils/app_padding/app_padding.dart';
import '../../../../core/basics_shared_widgets/custom_cached_network_image/custom_cached_network_image.dart';
import '../../../../core/icon_broken/icon_broken.dart';
import '../../../../utils/app_size/app_size.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(),
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const CustomCachedNetworkImage(
                  imageUrl:
                      'https://img.freepik.com/free-vector/mountains-desert-dunes-landscape_23-2148271245.jpg?w=740&t=st=1658964364~exp=1658964964~hmac=7f0e00e1e2516d8f9f51860152d09474627a0451e6b57ea2f7ed43f5b6c87cd',
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
                                'Ahmed El_Sayyad Mohamed ali ',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.titleSmall,
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
                          ],
                        ),
                        Text(
                          'November 25/11/2024',
                          style: Theme.of(context).textTheme.bodySmall,
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
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                start: AppPadding.p12,
                end: AppPadding.p12,
                top: AppPadding.p12,
              ),
              child: Column(
                children: [
                  Text(
                    'model.containingOfPost.toString()...................'
                    '................................................'
                    '...............................................',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(
                    height: 10,
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
                              style: Theme.of(context).textTheme.bodySmall,
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
                              width: 10,
                            ),
                            Text(
                              '10',
                              style: Theme.of(context).textTheme.bodySmall,
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
                        child: Row(
                          children: [
                            const CustomCachedNetworkImage(
                              imageUrl: '',
                              radius: 30,
                            ),
                            SizedBox(
                              width: context.widthPercent(AppSize.s03),
                            ),
                            Text(
                              "write a comment......",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: Colors.grey[500]),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            const Icon(
                              IconBroken.Heart,
                              color: Colors.indigo,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "like",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
