import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../../app/modules/recent_module/domain/mock/list_user_mock.dart';
import '../../../app/modules/messages_module/presenter/page/chat_page.dart';

class SliverListWidget extends StatefulWidget {
  // final VoidCallback onTap;
  final String date;
  final String messageUser;

  const SliverListWidget({
    Key? key,
    // required this.onTap,
    required this.date,
    required this.messageUser,
  }) : super(key: key);

  @override
  State<SliverListWidget> createState() => _SliverListWidgetState();
}

class _SliverListWidgetState extends State<SliverListWidget> {
  /// rx = reativo, valor dinamico q altera o estado da tela
  final rxSelected = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final ColorsExtension colorsExtension =
        Theme.of(context).extension<ColorsExtension>()!;
    final list = listUserMock;

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return ValueListenableBuilder(
            valueListenable: rxSelected,
            builder: (context, value, _) {
              return Container(
                decoration: BoxDecoration(
                    borderRadius: index == 0
                        ? const BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50),
                          )
                        : BorderRadius.circular(0),
                    color: colorsExtension.cardSliverListHome),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: index == 0 ? size.width * 0.06 : 0,
                  ),
                  child: SizedBox(
                    height: 90,
                    child: ComponentsCardMessageHomeWidget(
                      date: widget.date,
                      user: listUserMock[index],
                      selectedItem: rxSelected.value == index,
                      message: widget.messageUser,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ChatPage(
                              userEntity: listUserMock[index],
                            ),
                          ),
                        );
                      },
                      // widget.onTap,
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
