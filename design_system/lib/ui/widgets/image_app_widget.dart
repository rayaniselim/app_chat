import 'package:flutter/material.dart';

class ImageAppWidget extends StatelessWidget {
  final String image;
  final double sizeImage;
  const ImageAppWidget({
    required this.image,
    super.key,
    required this.sizeImage,
  });
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: sizeImage,
      backgroundImage: Image.asset(image).image,
    );
  }
}
