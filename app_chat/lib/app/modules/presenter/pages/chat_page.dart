import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return const Scaffold(
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [
          AppBarChatWidget(),
        ],
      ),
    );
  }
}
