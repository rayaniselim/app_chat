import 'package:app_chat/app/modules/domain/entities/user_model.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import '../../message_module/components/list_view_messagens.dart';
import '../../message_module/infra/service/auth/auth_service.dart';
import '../../message_module/infra/service/chat/chat_service.dart';

class ChatPage extends StatefulWidget {
  final UserModel userModel;
  const ChatPage({
    super.key,
    required this.userModel,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  String _message = '';
  final _messageController = TextEditingController();

// uma variavel pra receber as mensagens
  Future<void> _sendMessage() async {
    final userModel = AuthService().currentUser;

    if (userModel != null) {
      await ChatService().save(_message, userModel);
      _messageController.clear();
    }
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
          imageMock: widget.userModel.image,
          nameMock: widget.userModel.name,
          sizeImage: size.height * 0.10,
          icon: Icon(
            Icons.search,
            size: size.width * 0.07,
          ),
        ),
      ),
      body: Column(
        children: [
          // SizedBox(
          //   height: size.height * 0.012,
          // ),
          const ListViewMessage(),
          SizedBox(height: size.height * 0.7),
          TextFieldChatWidget(
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
                onPressedIcon: () {
                  _message.isEmpty ? null : _sendMessage;
                }
                // TODO: VER PQ NAO FUNCIONA O BOTAO
                // onPressedSuffixIcon: _message.isEmpty ? null : _sendMessage,
                ),
          ),
        ],
      ),
    );
  }
}
