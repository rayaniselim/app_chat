import 'package:flutter/material.dart';

import '../../../design_system.dart';

class TextFieldPasswordWdiget extends StatefulWidget {
  // final TextEditingController controller;

  const TextFieldPasswordWdiget({
    super.key,
    // required this.controller,
  });

  @override
  State<TextFieldPasswordWdiget> createState() =>
      _TextFieldPasswordWdigetState();
}

class _TextFieldPasswordWdigetState extends State<TextFieldPasswordWdiget> {
  @override
  Widget build(BuildContext context) {
    bool isObscure = true;
    return TextFormField(
      initialValue: '123456',
      style: TextStyles.textMediumRecent,

      /// COLOCAR O VALIDATORS - PASTA
      keyboardType: TextInputType.none,
      obscureText: isObscure,
      // controller: controller,
      decoration: InputDecoration(
        fillColor: ColorsApp.myMessageContainerColorDark,
        hintText: 'Password',
        hintStyle: TextStyles.textMediumRecent,
        labelText: 'Password',
        labelStyle: TextStyles.textMediumRecent,
        suffixIcon: GestureDetector(
          child: isObscure == true
              ? const Icon(
                  Icons.visibility_off_outlined,
                  size: 19,
                )
              : const Icon(
                  Icons.visibility_outlined,
                  size: 19,
                ),
          onTap: () {
            setState(() {
              isObscure = !isObscure;
            });
          },
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
