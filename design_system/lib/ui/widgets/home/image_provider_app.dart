import 'package:flutter/material.dart';

class ImageProviderWidget extends StatelessWidget {
  final ImageProvider<Object>? imageProvider;
  final double sizeImage;
  const ImageProviderWidget({
    super.key,
    required this.sizeImage,
    this.imageProvider,
  });
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: sizeImage,
      backgroundImage: imageProvider,
    );
  }
}
