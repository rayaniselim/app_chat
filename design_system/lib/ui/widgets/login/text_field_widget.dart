import 'package:flutter/material.dart';

import '../../../design_system.dart';

class TextFieldLoginWdiget extends StatelessWidget {
  // final TextEditingController controller;
  final TextInputType keyboardType;
  final String hintText;
  final String labelText;
  final bool obscure;
  final IconData icon;

  const TextFieldLoginWdiget(
      {super.key,
      // required this.controller,
      required this.keyboardType,
      required this.hintText,
      required this.labelText,
      required this.obscure,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return TextField(
      /// COLOCAR O VALIDATORS - PASTA
      keyboardType: keyboardType,
      // controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(
        fillColor: ColorsApp.myMessageContainerColor,
        hintText: hintText,
        hintStyle: TextStyles.textMediumRecent,
        labelText: labelText,
        labelStyle: TextStyles.textMediumRecent,
        suffixIcon: Icon(
          icon,
          color: ColorsApp.primary,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorsApp.primary,
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 0.5,
            color: ColorsApp.primary,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }
}
