import 'package:design_system/design_system.dart';
import 'package:design_system/ui/styles/colors_app.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: ColorsApp.primary, // TODO: CADE O TEMA?
      body: const CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [
          AppBarChatWidget(),
        ],
      ),
    );
  }
}
