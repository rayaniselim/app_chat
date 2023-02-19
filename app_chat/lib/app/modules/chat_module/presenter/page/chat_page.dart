import 'package:app_chat/app/modules/domain/entities/model.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final UserModel user;
  const ChatPage({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final size = mediaQuery.size;
    // final list = const ListUserMock().listUserMock(
    //   height: size.height * 0.05,
    //   width: size.width * 0.045,
    // );

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(0, 100),
        child: AppBarChatWidget(
          onPressedIcon: () {},
          imageMock: user.image,
          nameMock: user.name,
          sizeImage: size.height * 0.10,
          icon: Icon(
            Icons.search,
            size: size.width * 0.07,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.012,
          ),
          const CardMessagesChat(
            dataChat: 'Date',
// TODO: Fazer que printe o horario recebido
            senderMessage: 'mensagem remetente',
            recipientMessage: 'mensagem destinatario',
          ),
          TextFieldChatWidget(
            prefixIcon: const Icon(
              Icons.camera_alt_outlined,
              size: 50,
            ),
            onPressedPrefixIcon: () {},
            suffixIcon: const Icon(Icons.arrow_forward_ios_rounded),
            hintText: 'Message',
            onPressedSuffixIcon: () {},
          ),
        ],
      ),
    );
  }
}
