// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../design_system.dart';

class ButtonLoginWidget extends StatelessWidget {
  final Function()? onPressed;

  const ButtonLoginWidget({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        height: 35,
        width: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ColorsApp.myMessageContainerColor,
        ),
        child: Center(
          child: Text(
            'Cadastro',
            style: TextStyles.textRegularMessageChat,
          ),
        ),
      ),
    );
  }
}
