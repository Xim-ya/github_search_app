import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:github_search_app/app/helper/extension/image_extension.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({Key? key, required this.imgUrl, required this.size})
      : super(key: key);

  final String imgUrl;
  final double size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(size / 2),
      child: CachedNetworkImage(
        imageUrl: imgUrl,
        memCacheHeight: 44.cacheSize(context),
        height: size,
        width: size,
        fit: BoxFit.cover,
      ),
    );
  }
}
