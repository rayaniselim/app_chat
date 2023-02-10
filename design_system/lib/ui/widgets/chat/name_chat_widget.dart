import 'package:flutter/material.dart';
import '../../styles/text_styles.dart';

class NameChatWidget extends StatelessWidget {
  /// TODO: DEPOIS PASSAR PELO INDEX OS NOMES
  const NameChatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Danny Hopkins',
      style: TextStyles.textSemiBoldTitles.copyWith(
        fontSize: 20,
      ),
      textAlign: TextAlign.left,
    );
  }
}
