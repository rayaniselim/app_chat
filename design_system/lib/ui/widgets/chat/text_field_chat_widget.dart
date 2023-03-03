import 'package:flutter/material.dart';

import '../../../design_system.dart';

class TextFieldChatWidget extends StatelessWidget {
  final String hintText;
  final Icon prefixIcon;
  final void Function()? onPressedPrefixIcon;
  final TextEditingController controller;
  final Widget child;

  const TextFieldChatWidget({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    required this.onPressedPrefixIcon,
    required this.controller,
    required this.child,
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
        constraints: BoxConstraints(
          maxHeight: size.width * 0.95,
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: controller,
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
                    suffixIcon: child,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
