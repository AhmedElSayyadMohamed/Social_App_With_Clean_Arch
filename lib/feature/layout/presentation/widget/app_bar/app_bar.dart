import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:social_app/utils/app_padding/app_padding.dart';
import 'package:social_app/utils/app_size/app_size.dart';

import '../../../../../core/icon_broken/icon_broken.dart';
import '../../../../../utils/strings_manager/strings_manager.dart';


class CustomLayoutAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String userPhoto;

  const CustomLayoutAppBar({
    super.key,
    required this.userPhoto,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        padding: const EdgeInsetsDirectional.all(8),
        onPressed: (){},
        icon: const Icon(
          IconBroken.Category,
          size: AppSize.s3,
        ),
      ),
      title: const Text(StringsManager.layoutTitle),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsetsDirectional.only(end: AppPadding.p16),
          child: GestureDetector(
            onTap: (){},
            child: CircleAvatar(
              radius: AppSize.s2,
              backgroundColor: Colors.lightBlue,
              child: CircleAvatar(
                radius: 25,
                child: CachedNetworkImage(
                  imageUrl: userPhoto,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      Image.asset("assets/images/loading.gif"),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

