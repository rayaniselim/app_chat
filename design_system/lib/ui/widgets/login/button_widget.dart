import 'package:flutter/material.dart';

import '../../../design_system.dart';

class ButtonWidget extends StatelessWidget {
  final void Function() onPressed;
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
        elevation: MaterialStateProperty.all(0),
        backgroundColor: MaterialStateProperty.all(
          ColorsApp.myMessageContainerColorDark, //TODO: cor tema extension
        ),
        fixedSize: MaterialStateProperty.all(Size(width, height)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
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
