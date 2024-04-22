import 'package:cached_network_image/cached_network_image.dart';
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
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              image: DecorationImage(
                image: CachedNetworkImageProvider(profilePhoto), // Replace with your image asset path
              ),
            ),
          ),
        ),
        PositionedDirectional(
          bottom: -5,
          end: -5,
          child: IconButton(
            onPressed: () => _onTapToPickAnewProfilePic,
            icon: const Icon(
              IconBroken.camera,
              size: 25,
            ),
          ),
        )
      ],
    );
  }

  get _onTapToPickAnewProfilePic {}

  get _onTapProfilePic {}
}
