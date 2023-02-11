import 'package:app_chat/core/data/list_story_data.dart';
import 'package:flutter/material.dart';

import 'components_card_message_home_widget.dart';

class CardSliverListWidget extends StatelessWidget {
  final VoidCallback onTap;
  CardSliverListWidget({Key? key, required this.onTap}) : super(key: key);

  final rxSelected = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final list = ListStoriesData().listStoriesData(
      height: size.height * 0.08,
      width: size.width * 0.18,
    );
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int indexAtual) {
          return ValueListenableBuilder(
            valueListenable: rxSelected,
            builder: (context, value, _) {
              return SizedBox(
                height: 90,
                child: ComponentsCardMessageHomeWidget(
                  onTap: onTap,
                ),
              );
            },
          );
        },
        childCount: list.length,
      ),
    );
  }
}
