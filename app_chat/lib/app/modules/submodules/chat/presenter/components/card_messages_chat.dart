import 'package:app_chat/app/modules/submodules/chat/domain/entities/chat_entity.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class CardMessagesChat extends StatelessWidget {
  final String dataChatTop;
  final String dataChat;

  final ChatEntity message;
  final bool currentUser;

  const CardMessagesChat({
    super.key,
    required this.dataChat,
    required this.currentUser,
    required this.message,
    required this.dataChatTop,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.73,
      width: size.width,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            TextDataWidget(
              text: dataChatTop,
              style: TextStyles.textRegularDateChat,
            ),
            SizedBox(
              height: size.height * 0.015,
            ),
            MessageUserWidget(
              messageText: message,
              currentUser: currentUser,
            ),
            TextDataWidget(
              text: dataChat,
              style: TextStyles.textRegularDateChat,
            ),
          ],
        ),
      ),
    );
  }
}
