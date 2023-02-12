import 'package:app_chat/core/mock/list_story_mock.dart';

import 'package:flutter/material.dart';
import '../../../design_system.dart';

class NameChatWidget extends StatelessWidget {
  const NameChatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final list = const ListStoriesMock().listStoriesMock(
      height: 0,
      width: 0,
    );
    return Text(
      /// TODO: DEPOIS PASSAR PELO INDEX OS NOMES
      list[0].name,
      style: TextStyles.textSemiBoldTitles.copyWith(
        fontSize: 20,
      ),
      textAlign: TextAlign.left,
    );
  }
}
