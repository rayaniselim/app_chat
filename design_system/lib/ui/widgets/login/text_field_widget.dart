import 'package:flutter/material.dart';
import '../../../design_system.dart';

class TextFieldWdiget extends StatelessWidget {
  final String hintText;
  final String labelText;
  final TextInputType keyboardType;
  final Widget icon;
  final bool isObscure;
  final TextEditingController? controller;

  const TextFieldWdiget({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.keyboardType,
    required this.icon,
    required this.isObscure,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyles.textMediumRecent,
      obscureText: isObscure,
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
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
          borderSide: const BorderSide(
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: const BorderSide(
            width: 1.5,
          ),
        ),
      ),
    );
  }
}
