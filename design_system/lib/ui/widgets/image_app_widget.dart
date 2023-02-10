import 'package:flutter/material.dart';

class ImageAppWidget extends StatelessWidget {
  final double height;
  final double width;

  const ImageAppWidget({
    super.key,
    required this.height,
    required this.width,
  });
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(1000),
      child: Image.asset(
        'assets/image/hyun-bin.webp',
        fit: BoxFit.cover,
        height: height,
        width: width,
      ),
    );
  }
}
