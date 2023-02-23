import 'package:app_chat/app/modules/get_message_module/domain/entities/message_entity.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class CardMessagesChat extends StatelessWidget {
  final String dataChat;
  final MessageEntity message;
  final bool currentUser;

  const CardMessagesChat({
    super.key,
    required this.dataChat,
    required this.currentUser,
    required this.message,
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
              text: dataChat,
              style: TextStyles.textRegularDateChat,
            ),
            SizedBox(
              height: size.height * 0.015,
            ),
            MessageUserWidget(
              messageText: message,
              currentUser: currentUser,
            ),
          ],
        ),
      ),
    );
  }
}
