import 'package:design_system/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

class ForgotMyPasswordWidget extends StatelessWidget {
  final void Function()? onTap;
  const ForgotMyPasswordWidget({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        'forgot my password',
        style: TextStyles.textMediumRecent,
      ),
    );
  }
}
