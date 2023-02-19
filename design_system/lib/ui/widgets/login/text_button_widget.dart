import 'package:design_system/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  final String title;
  final void Function() onTap;
  const TextButtonWidget({
    super.key,
    required this.onTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        title,
        style: TextStyles.textMediumRecent,
      ),
    );
  }
}
