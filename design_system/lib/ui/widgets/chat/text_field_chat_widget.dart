import 'package:flutter/material.dart';

import '../../../design_system.dart';

class TextFieldChatWidget extends StatelessWidget {
  final String hintText;
  final Icon prefixIcon;
  final void Function() onPressedPrefixIcon;
  final Icon suffixIcon;
  final void Function() onPressedSuffixIcon;

  const TextFieldChatWidget({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    required this.onPressedPrefixIcon,
    required this.suffixIcon,
    required this.onPressedSuffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final ColorsExtension colorsExtension =
        Theme.of(context).extension<ColorsExtension>()!;

    return Padding(
      padding: EdgeInsets.only(
        left: size.width * 0.06,
        right: size.width * 0.06,
      ),
      child: Container(
        height: size.height * 0.055,
        width: size.width * 0.95,
        decoration: BoxDecoration(
          color: colorsExtension.containerTextFieldChat,
          borderRadius: BorderRadius.circular(1000),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyles.textRegularCardMessageChat,
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(
                top: size.height * 0.2,
                bottom: size.height * 0.01,
              ),
              prefixIcon: FittedBox(
                child: Container(
                  // Camera
                  height: size.height * 0.1,
                  width: size.width * 0.2,
                  decoration: BoxDecoration(
                    color: colorsExtension.circleCamera,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: IconButtonWidget(
                    icon: prefixIcon,
                    onPressedIcon: onPressedPrefixIcon,
                  ),
                ),
              ),
              suffixIcon: IconButtonWidget(
                icon: suffixIcon,
                onPressedIcon: onPressedSuffixIcon,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
