import 'package:app_chat/core/mock/list_story_mock.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

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
        (BuildContext context, int indexActual) {
          return ValueListenableBuilder(
            valueListenable: rxSelected,
            builder: (context, value, _) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: indexActual == 0
                      ? const BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        )
                      : BorderRadius.circular(0),
                  color: ColorsApp.cardChatsColorDark, // COR
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: indexActual == 0 ? 25 : 0, // INGLES
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
