import 'package:flutter/material.dart';

class IconSearchWidget extends StatelessWidget {
  const IconSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return IconButton(
      onPressed: () {},
      icon: Icon(
        Icons.search,
        size: size.height * 0.02 + size.width * 0.0021, //28,
      ),
    );
  }
}
