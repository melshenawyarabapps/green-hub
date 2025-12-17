import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:greenhub/core/generated/assets.dart';

class NetworkImageWidget extends StatelessWidget {
  const NetworkImageWidget({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(imageUrl: imageUrl,
    placeholder: (_,_)=>Image.asset(Assets.iconsLogo),
    errorWidget: (_,_,_)=>Image.asset(Assets.iconsLogo),
    );
  }
}
