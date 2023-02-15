import 'package:flutter/material.dart';

import '../../../design_system.dart';

class TextFieldWdiget extends StatelessWidget {
  final String initialValue;
  final String hintText;
  final String labelText;
  final TextInputType keyboardType;
  final Widget icon;
  final bool isObscure;
  // final TextEditingController controller;

  const TextFieldWdiget({
    super.key,
    required this.initialValue,
    required this.hintText,
    required this.labelText,
    required this.keyboardType,
    required this.icon,
    required this.isObscure,
    // required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      style: TextStyles.textMediumRecent,
      obscureText: isObscure,
      keyboardType: keyboardType,

      /// COLOCAR O VALIDATORS - PASTA DOMAIN
      // controller: controller,
      decoration: InputDecoration(
        fillColor: ColorsApp.myMessageContainerColorDark,
        hintText: hintText,
        hintStyle: TextStyles.textMediumRecent,
        labelText: labelText,
        labelStyle: TextStyles.textMediumRecent,
        suffixIcon: icon,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(
            color: Theme.of(context).errorColor,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(
            color: Theme.of(context).errorColor,
            width: 1.5,
          ),
        ),
      ),
    );
  }
}
