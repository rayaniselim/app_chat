import 'package:flutter/material.dart';

import '../../styles/text_styles.dart';

class TextDataChat extends StatelessWidget {
  const TextDataChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'data',
        style: TextStyles.textRegularDateChat,
      ),
    );
  }
}
