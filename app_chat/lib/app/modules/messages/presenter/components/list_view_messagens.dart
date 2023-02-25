import 'package:app_chat/app/modules/messages/domain/entities/message_entity.dart';
import 'package:app_chat/core/domain/entities/user_entity.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import '../../infra/service/chat_service.dart';
import 'card_messages_chat.dart';

class ListViewMessage extends StatelessWidget {
  const ListViewMessage({super.key});

  @override
  Widget build(BuildContext context) {
    final data = '${DateTime.now().day}/0${DateTime.now().month}  ';
    final hora = '${DateTime.now().hour}:${DateTime.now().minute}';
    final dataChatTop = data + hora;
    const currentUser = UserEntity(
      id: '1',
      image: '',
      name: 'ray',
      email: 'rayani@user.com',
    );

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
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              // reverse: true, // FAZ A MENSAGEM IR NA ORDEM
              itemCount: msgs.length,
              itemBuilder: (context, index) => CardMessagesChat(
                key: ValueKey(msgs[index].id),
                message: msgs[index],
                currentUser: currentUser.id == msgs[index].userId,
                dataChat: hora,
                dataChatTop: dataChatTop,
              ),
            ),
          );
        }
      },
    );
  }
}
