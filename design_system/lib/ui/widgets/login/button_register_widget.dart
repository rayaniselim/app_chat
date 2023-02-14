import 'package:design_system/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

class ButtonRegisterWidget extends StatelessWidget {
  final void Function()? onTap;
  const ButtonRegisterWidget({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        'Register',
        style: TextStyles.textMediumRecent,
      ),
    );
  }
}
