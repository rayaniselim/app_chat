import 'package:flutter/material.dart';

class ImageAppWidget extends StatelessWidget {
  final String image;

  const ImageAppWidget({
    required this.image,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 37,
      backgroundImage: Image.asset(image).image,
    );
  }
}
