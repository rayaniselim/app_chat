import 'package:flutter/material.dart';

import '../../../design_system.dart';

class ButtonWidget extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  final double height;
  final double width;
  const ButtonWidget({
    Key? key,
    required this.onPressed,
    required this.title,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(Size(width, height)),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyles.textRegularMessageChat,
        ),
      ),
    );
  }
}
