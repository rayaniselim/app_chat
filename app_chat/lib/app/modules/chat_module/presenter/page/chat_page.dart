import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import '../../../../../core/mock/list_user_mock.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({
    super.key,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final size = mediaQuery.size;
    final list = const ListUserMock().listUserMock(
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
