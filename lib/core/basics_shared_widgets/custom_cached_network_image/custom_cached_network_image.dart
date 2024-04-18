import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class CustomCachedNetworkImage extends StatelessWidget {

  final String imageUrl;
  final double borderRadius;
  final double radius;
  const CustomCachedNetworkImage({
    super.key, required this.imageUrl,
     this.borderRadius = 50,
     this.radius = 50,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius,
      height: radius,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        placeholder: (context, url) => Image.asset(
          "assets/images/loading.gif",
        ),
        errorWidget: (context, url, error) =>
        const Icon(
          Icons.error,
          size: 16,
        ),
      ),
    );
  }
}
