import 'package:app_chat/app/modules/submodules/chat/domain/entities/chat_entity.dart';

import 'package:app_chat/app/core/domain/entities/user_entity.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'card_messages_chat.dart';

class ListViewMessage extends StatelessWidget {
  const ListViewMessage({super.key});

  @override
  Widget build(BuildContext context) {
    final date = '${DateTime.now().day}/0${DateTime.now().month}  ';
    final hora = '${DateTime.now().hour}:${DateTime.now().minute}';
    final dateChatTop = date + hora;
    const currentUser = UserEntity(
      idUser: '1',
      image: '',
      name: 'ray',
      email: 'rayani@user.com',
    );

    return StreamBuilder<List<ChatEntity>>(
      // stream: ChatService().messagesStream(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(
            child: TextDataWidget(
              text: '$date \n Não possui mensagens',
              style: TextStyles.textRegularDateChat,
            ),
          );
        } else {
          final msgs = snapshot.data!;
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              // reverse: true, // FAZ A MEssage IR NA ORDEM
              itemCount: msgs.length,
              itemBuilder: (context, index) => CardMessagesChat(
                key: ValueKey(msgs[index]),
                message: msgs[index],
                currentUser: currentUser.idUser == msgs[index].idSender,
                dataChat: hora,
                dataChatTop: dateChatTop,
              ),
            ),
          );
        }
      },
    );
  }
}
