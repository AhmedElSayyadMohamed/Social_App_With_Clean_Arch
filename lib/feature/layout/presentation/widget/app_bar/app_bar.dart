import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:social_app/core/basics_shared_widgets/custom_cached_network_image/custom_cached_network_image.dart';
import 'package:social_app/utils/app_padding/app_padding.dart';
import 'package:social_app/utils/app_size/app_size.dart';
import '../../../../../core/icon_broken/icon_broken.dart';
import '../../../../../core/router/routing_name.dart';

class CustomLayoutAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  const CustomLayoutAppBar({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        padding: const EdgeInsetsDirectional.all(8),
        onPressed: () {},
        icon: const Icon(
          IconBroken.Category,
          size: AppSize.s3,
        ),
      ),
      title: Text(title),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsetsDirectional.only(end: AppPadding.p16),
          child: GestureDetector(
            onTap: ()=> Navigator.pushNamed(context, Routes.profileRoute),
            child: const CircleAvatar(
              radius: AppSize.s2,
              backgroundImage:CachedNetworkImageProvider(
              'https://img.freepik.com/free-vector/mountains-desert-dunes-landscape_23-2148271245.jpg?w=740&t=st=1658964364~exp=1658964964~hmac=7f0e00e1e2516d8f9f51860152d09474627a0451e6b57ea2f7ed43f5b6c87cdb', // Replace with your image URL
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
