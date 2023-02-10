import 'package:flutter/material.dart';

class ImageAppWidget extends StatelessWidget {
  const ImageAppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(1000),
      child: Image.asset(
        'assets/image/hyun-bin.webp',
        fit: BoxFit.cover,
        height: size.height * 1.58,
        width: size.width * 0.038,
      ),
    );
  }
}
