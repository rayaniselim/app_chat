import 'package:flutter/material.dart';

import '../../../design_system.dart';

class TextFieldEmailWdiget extends StatelessWidget {
  // final TextEditingController controller;

  const TextFieldEmailWdiget({
    super.key,
    // required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: 'rayani@user.com',
      style: TextStyles.textMediumRecent,

      /// COLOCAR O VALIDATORS - PASTA
      keyboardType: TextInputType.emailAddress,
      // controller: controller,
      decoration: InputDecoration(
        fillColor: ColorsApp.myMessageContainerColorDark,
        hintText: 'Email',
        hintStyle: TextStyles.textMediumRecent,
        labelText: 'Email',
        labelStyle: TextStyles.textMediumRecent,
        suffixIcon: const Icon(
          (Icons.email_outlined),
        ),
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
