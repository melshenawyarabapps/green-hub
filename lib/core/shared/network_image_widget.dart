import 'package:flutter/material.dart';
import 'package:cached_network_image_plus/cached_network_image_plus.dart';
import 'package:gold/core/config/app_config.dart';

class NetworkImageWidget extends StatelessWidget {
  const NetworkImageWidget({
    super.key,
    required this.imageUrl,
    this.emptyHolder = false,
    this.holder = '',
    this.animate = false,
    this.fit,
  });

  final String imageUrl;
  final String holder;
  final bool emptyHolder;
  final bool animate;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return CachedImageWidget(
      url: imageUrl,
      fit: fit,
      placeholder: PlaceHolderWidget(emptyHolder: emptyHolder, holder: holder),
    );
  }
}

class PlaceHolderWidget extends StatelessWidget {
  const PlaceHolderWidget({
    super.key,
    required this.emptyHolder,
    required this.holder,
  });

  final bool emptyHolder;
  final String holder;

  @override
  Widget build(BuildContext context) {
    return emptyHolder
        ? const SizedBox()
        : Image.asset(holder.isNotEmpty ? holder : AppConfig.instance.appLogo);
  }
}
