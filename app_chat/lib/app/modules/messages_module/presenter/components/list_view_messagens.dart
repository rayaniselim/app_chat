import 'package:app_chat/app/modules/messages_module/domain/entities/message_entity.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../../login_module/infra/auth/auth_service.dart';
import '../../infra/service/chat/chat_service.dart';
import 'card_messages_chat.dart';

class ListViewMessage extends StatelessWidget {
  const ListViewMessage({super.key});

  @override
  Widget build(BuildContext context) {
    final data = '${DateTime.now().day}/${DateTime.now().month}';
    final hora = '${DateTime.now().hour}:${DateTime.now().minute}';
    final dataChat = data + hora;
    final currentUser = AuthService().currentUser;

    return StreamBuilder<List<MessageEntity>>(
      stream: ChatService().messagesStream(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(
            child: TextDataWidget(
              text: '$data \n Não possui mensagens',
              style: TextStyles.textRegularDateChat,
            ),
          );
        } else {
          final msgs = snapshot.data!;
          return ListView.builder(
            reverse: true, // FAZ A MENSAGEM IR NA ORDEM
            itemCount: msgs.length,
            itemBuilder: (context, index) => CardMessagesChat(
              key: ValueKey(msgs[index].id),
              message: msgs[index],
              currentUser: currentUser?.id == msgs[index].userId,
              dataChat: dataChat,
            ),
          );
        }
      },
    );
  }
}
