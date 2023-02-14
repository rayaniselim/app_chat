import 'package:app_chat/core/mock/list_story_mock.dart';
import 'package:flutter/material.dart';

import '../../../design_system.dart';

class SliverListWidget extends StatelessWidget {
  final VoidCallback onTap;
  SliverListWidget({Key? key, required this.onTap}) : super(key: key);

  final rxSelected = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final list = const ListStoriesMock().listStoriesMock(
      height: size.height * 0.08,
      width: size.width * 0.18,
    );
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int indexAtual) {
          return ValueListenableBuilder(
            valueListenable: rxSelected,
            builder: (context, value, _) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: indexAtual == 0
                      ? const BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        )
                      : BorderRadius.circular(0),
                  color: ColorsApp.cardChatsColorDark,
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: indexAtual == 0 ? 25 : 0,
                  ),
                  child: SizedBox(
                    height: 90,
                    child: ComponentsCardMessageHomeWidget(
                      onTap: onTap,
                    ),
                  ),
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
