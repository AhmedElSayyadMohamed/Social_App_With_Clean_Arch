import 'package:flutter/material.dart';
import 'package:social_app/utils/app_border/app_border.dart';
import 'package:social_app/utils/app_padding/app_padding.dart';

class FriendsStatus extends StatelessWidget {
  const FriendsStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsetsDirectional.only(
            start: AppPadding.p8,
        ),
        itemBuilder:(context,index)=> Container(
          margin: const EdgeInsetsDirectional.symmetric(
              horizontal: AppPadding.p2,
              vertical: AppPadding.p8,
          ),
          width: 110,
          decoration: BoxDecoration(
            color: Colors.indigo,
            borderRadius: BorderRadius.circular(AppBorder.b12),
          ),
        ),
        itemCount: 7,
      ),
    );

  }
}
