import 'package:flutter/material.dart';

class ColorsExtension extends ThemeExtension<ColorsExtension> {
  final Color? containerLogin;
  final Color? cardRecipientMessage;
  final Color? cardSenderMessage;
  final Color? cardSliverListHome;
  final Color? containerTextFieldChat;
  final Color? circleCamera;

  ColorsExtension({
    required this.cardSliverListHome,
    required this.containerTextFieldChat,
    required this.containerLogin,
    required this.circleCamera,
    required this.cardRecipientMessage,
    required this.cardSenderMessage,
  });

  @override
  ThemeExtension<ColorsExtension> copyWith({Color? container}) {
    return ColorsExtension(
      containerLogin: container ?? containerLogin,
      cardRecipientMessage: cardRecipientMessage ?? cardRecipientMessage,
      cardSenderMessage: cardSenderMessage ?? cardSenderMessage,
      cardSliverListHome: cardSenderMessage ?? cardSenderMessage,
      containerTextFieldChat: containerTextFieldChat ?? containerTextFieldChat,
      circleCamera: circleCamera ?? circleCamera,
    );
  }

  @override
  ThemeExtension<ColorsExtension> lerp(
      ThemeExtension<ColorsExtension>? other, double t) {
    if (other is! ColorsExtension) {
      return this;
    }
    return ColorsExtension(
      containerLogin: Color.lerp(containerLogin, other.containerLogin, t),
      cardRecipientMessage:
          Color.lerp(cardRecipientMessage, other.cardRecipientMessage, t),
      cardSenderMessage:
          Color.lerp(cardSenderMessage, other.cardSenderMessage, t),
      cardSliverListHome:
          Color.lerp(cardSliverListHome, other.cardSliverListHome, t),
      containerTextFieldChat:
          Color.lerp(containerTextFieldChat, other.containerTextFieldChat, t),
      circleCamera: Color.lerp(circleCamera, other.circleCamera, t),
    );
  }
}
