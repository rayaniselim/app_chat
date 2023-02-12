import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(0, 100),
        child: AppBarChatWidget(),
      ),
      body: Column(
        children: const [
          SizedBox(
            height: 18, //50
          ),
          CardMessagesChat(),
          TextFieldChatWidget(),
        ],
      ),
    );
  }
}
