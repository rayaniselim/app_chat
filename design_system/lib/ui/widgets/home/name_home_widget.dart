import 'package:flutter/material.dart';

import '../../styles/text_styles.dart';

class NameHomeWidget extends StatelessWidget {
  /// TODO: DEPOIS PASSAR PELO INDEX OS NOMES
  const NameHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Danny Hopkins',
      style: TextStyles.textSemiBoldTitles.copyWith(
        fontSize: 15,
      ),
      textAlign: TextAlign.left,
    );
  }
}
