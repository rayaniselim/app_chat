import 'package:app_chat/app/modules/messages/domain/entities/message_entity.dart';
import 'package:flutter/material.dart';
import '../../../design_system.dart';

class MessageUserWidget extends StatelessWidget {
  final MessageEntity messageText;
  final bool currentUser;

  const MessageUserWidget({
    required this.messageText,
    required this.currentUser,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final ColorsExtension colorsExtension =
        Theme.of(context).extension<ColorsExtension>()!;

    return Row(
      mainAxisAlignment:
          currentUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: size.width * 0.065,
            bottom: size.height * 0.01,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: currentUser
                  ? colorsExtension.cardRecipientMessage
                  : colorsExtension.cardSenderMessage,
              borderRadius: BorderRadius.circular(20),
            ),
            constraints: BoxConstraints(
              maxWidth: size.width * 0.75,
            ),
            padding: EdgeInsets.only(
              left: size.width * 0.03,
              right: size.width * 0.05,
              bottom: size.height * 0.008,
              top: size.height * 0.008,
            ),
            margin: EdgeInsets.only(
              bottom: size.height * 0.01,
            ),
            child: Text(
              messageText.message,
              textAlign: currentUser ? TextAlign.right : TextAlign.left,
              style: TextStyles.textRegularMessageChat,
            ),
          ),
        ),
      ],
    );
  }
}
