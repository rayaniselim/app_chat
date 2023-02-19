import 'package:flutter/material.dart';

import '../../../design_system.dart';

class ImageStoriesWidget extends StatelessWidget {
  final String image;
  final double sizeImage;
  const ImageStoriesWidget({
    super.key,
    required this.image,
    required this.sizeImage,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return FittedBox(
      child: SizedBox(
        height: size.height * 0.08,
        child: ImageAppWidget(
          image: image,
          sizeImage: sizeImage,
        ),
      ),
    );
  }
}
