import 'package:flutter/material.dart';
import '../../../design_system.dart';

class NameChatWidget extends StatelessWidget {
  final String nameMock;
  const NameChatWidget({
    super.key,
    required this.nameMock,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      nameMock,
      style: TextStyles.textSemiBoldTitles.copyWith(
        fontSize: 20,
      ),
      textAlign: TextAlign.left,
    );
  }
}
