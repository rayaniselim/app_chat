import 'package:flutter/material.dart';

import '../../../design_system.dart';

class TextFieldChatWidget extends StatelessWidget {
  const TextFieldChatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(
        left: 25,
        right: 25,
      ),
      child: Container(
        height: 50,
        width: size.width * 0.95,
        decoration: BoxDecoration(
          color: ColorsApp.writeBoxColorDark,
          borderRadius: BorderRadius.circular(1000),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              fillColor: ColorsApp.writeBoxColorDark,
              hintText: 'Message',
              hintStyle: TextStyles.textRegularCardMessageChat,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(top: 10, bottom: 10),
              prefixIcon: FittedBox(
                child: Container(
                  height: 33,
                  width: 33,
                  decoration: BoxDecoration(
                    color: ColorsApp.iconsButtonChatTextFieldColorDark,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: IconButton(
                      icon: const Icon(
                        Icons.camera_alt_outlined,
                        size: 18,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.only(
                  bottom: 10,
                ),
                child: IconButton(
                  icon: const Icon(Icons.arrow_forward_ios_rounded),
                  iconSize: 18,
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
