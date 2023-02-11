import 'package:app_chat/core/data/list_story_data.dart';
import 'package:flutter/material.dart';
import '../../styles/text_styles.dart';

class NameChatWidget extends StatelessWidget {
  const NameChatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final list = ListStoriesData().listStoriesData(
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
