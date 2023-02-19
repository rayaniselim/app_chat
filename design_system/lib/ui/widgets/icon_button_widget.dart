import 'package:flutter/material.dart';

class IconButtonWidget extends StatelessWidget {
  final Icon icon;
  final void Function() onPressedIcon;

  const IconButtonWidget({
    super.key,
    required this.icon,
    required this.onPressedIcon,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressedIcon,
      icon: icon,
    );
  }
}
