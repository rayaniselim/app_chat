import 'package:flutter/material.dart';

class ImageAppWidget extends StatelessWidget {
  final double height;
  final double width;
  final String image;

  const ImageAppWidget({
    required this.height,
    required this.width,
    required this.image,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(1000),
      child: Image.asset(
        image,
        fit: BoxFit.cover,
        height: height,
        width: width,
      ),
    );
  }
}
