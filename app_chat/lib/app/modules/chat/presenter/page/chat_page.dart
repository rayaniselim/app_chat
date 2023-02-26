import 'package:app_chat/core/domain/entities/user_entity.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import '../../infra/service/chat_service.dart';
import '../components/list_view_messagens.dart';

class ChatPage extends StatefulWidget {
  final UserEntity userEntity;

  const ChatPage({
    super.key,
    required this.userEntity,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late String _message;
  final _messageController = TextEditingController();

// uma variavel pra receber as mensagens
  Future<void> _sendMessage() async {
    // const userEntity = UserEntity(
    //   idUser: '1',
    //   image: '',
    //   name: 'ray',
    //   email: 'rayani@user.com',
    // );
    // await ChatService().save(_messageController.text, userEntity);
    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final size = mediaQuery.size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(0, 100),
        child: AppBarChatWidget(
          onPressedIcon: () {},
          imageMock: widget.userEntity.image!,
          nameMock: widget.userEntity.name,
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
          const ListViewMessage(),
          SizedBox(height: size.height * 0.07),
          SafeArea(
            child: TextFieldChatWidget(
              prefixIcon: const Icon(
                Icons.camera_alt_outlined,
                size: 50,
              ),
              onPressedPrefixIcon: () {},
              hintText: 'Message',
              controller: _messageController,
              onChanged: (msg) => setState(() => _message = msg),
              onSubmitted: (_) {
                if (_message.isNotEmpty) {
                  _sendMessage();
                }
              },
              child: IconButtonWidget(
                  icon: const Icon(
                    Icons.arrow_forward_ios_rounded,
                  ),
                  onPressedIcon: () async {
                    await _sendMessage();
                  }

                  // TODO: VER PQ NAO A ORDEM DAS MENSAGENS
                  // onPressedSuffixIcon: _message.isEmpty ? null : _sendMessage,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
