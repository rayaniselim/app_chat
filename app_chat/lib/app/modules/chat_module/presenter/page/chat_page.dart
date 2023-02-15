import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../../../../core/mock/list_story_mock.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final size = mediaQuery.size;
    final list = const ListStoriesMock().listStoriesMock(
      height: size.height * 0.05,
      width: size.width * 0.045,
    );

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(0, 100),
        child: AppBarChatWidget(
          onPressedIcon: () {},
          // TODO: indexActual
          imageMock: list[0].image,
          nameMock: list[0].name,
          sizeImage: size.height * 0.10,
          icon: const Icon(
            Icons.search,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.012,
          ),
          const CardMessagesChat(),
          const TextFieldChatWidget(),
        ],
      ),
    );
  }
}
