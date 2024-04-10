import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class CustomCachedNetworkImage extends StatelessWidget {

  final String imageUrl;
  const CustomCachedNetworkImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.cover,
      imageUrl: imageUrl,
      placeholder: (context, url) => Image.asset(
        "assets/images/loading.gif",
      ),
      errorWidget: (context, url, error) =>   const Icon(Icons.error),
    );
  }
}
