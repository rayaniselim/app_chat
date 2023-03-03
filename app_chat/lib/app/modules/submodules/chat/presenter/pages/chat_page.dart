import 'package:cached_network_image/cached_network_image.dart';
import 'package:design_system/ui/widgets/chat/appbar_chat_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:app_chat/app/modules/submodules/chat/presenter/components/messages_list_component.dart';
import 'package:app_chat/app/modules/submodules/chat/presenter/controllers/chat_controller.dart';

import '../../../../../core/domain/entities/user_entity.dart';

class ChatPage extends StatefulWidget {
  final UserEntity usuarioDestinatario;
  final UserEntity usuarioRemetente;

  const ChatPage({
    super.key,
    required this.usuarioDestinatario,
    required this.usuarioRemetente,
  });

  @override
  State createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late ChatController chatController;

  @override
  void initState() {
    super.initState();
    chatController = Modular.get<ChatController>();
    chatController.usuarioDestinatario = widget.usuarioDestinatario;
    chatController.usuarioRemetente = widget.usuarioRemetente;
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final size = mediaQuery.size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(0, 100),
        child: AppBarChatWidget(
          imageMock: CachedNetworkImageProvider(
            chatController.usuarioDestinatario.imageUrl,
          ),
          nameMock: chatController.usuarioDestinatario.name,
          sizeImage: size.height * 0.10,
          icon: Icon(
            Icons.search,
            size: size.width * 0.07,
          ),
          onPressedIcon: () {},
        ),
      ),
      body: const MessageListComponent(),
    );
  }
}
