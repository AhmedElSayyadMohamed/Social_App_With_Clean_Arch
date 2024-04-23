import 'package:social_app/core/basics_shared_widgets/custom_cached_network_image/custom_cached_network_image.dart';
import 'package:social_app/core/icon_broken/icon_broken.dart';
import 'package:flutter/material.dart';

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({super.key, required this.profilePhoto});
  final String profilePhoto;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: _onTapProfilePic,
          child:CustomCachedNetworkImage(
              width: 100,
              height: 100,
              imageUrl:profilePhoto,
          ),
        ),
        PositionedDirectional(
            bottom: 0,
            end: 0,
            child: GestureDetector(
            onTap: _onTapToPickANewProfilePic,
            child:  CircleAvatar(
              backgroundColor: Colors.grey[200],
              radius: 15,
              child:  const Icon(
                IconBroken.camera,
                size: 25,
              ),
            ),
            )
        )
      ],
    );
  }

  get _onTapToPickANewProfilePic {}

  get _onTapProfilePic {}
}
